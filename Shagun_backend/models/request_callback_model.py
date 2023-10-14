from dataclasses import dataclass
from typing import Optional, Any, TypeVar, Type, cast


T = TypeVar("T")


def from_int(x: Any) -> int:
    assert isinstance(x, int) and not isinstance(x, bool)
    return x


def from_none(x: Any) -> Any:
    assert x is None
    return x


def from_union(fs, x):
    for f in fs:
        try:
            return f(x)
        except:
            pass
    assert False


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


@dataclass
class RequestCallbackModel:
    id: Optional[int] = None
    completed_by: Optional[str] = None
    status: Optional[int] = None
    uid: Optional[str] = None
    type: Optional[str] = None
    event_date: Optional[str] = None
    event_type: Optional[str] = None
    city: Optional[int] = None
    selected_reason: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'RequestCallbackModel':
        assert isinstance(obj, dict)
        id = from_union([from_int, from_none], obj.get("id"))
        completed_by = from_union([from_str, from_none], obj.get("completed_by"))
        status = from_union([from_int, from_none], obj.get("status"))
        uid = from_union([from_str, from_none], obj.get("uid"))
        type = from_union([from_str, from_none], obj.get("type"))
        event_date = from_union([from_str, from_none], obj.get("event_date"))
        event_type = from_union([from_str, from_none], obj.get("event_type"))
        city = from_union([from_int, from_none], obj.get("city"))
        selected_reason = from_union([from_str, from_none], obj.get("selected_reason"))
        return RequestCallbackModel(id, completed_by, status, uid, type, event_date, event_type, city, selected_reason)

    def to_dict(self) -> dict:
        result: dict = {}
        if self.id is not None:
            result["id"] = from_union([from_int, from_none], self.id)
        if self.completed_by is not None:
            result["completed_by"] = from_union([from_str, from_none], self.completed_by)
        if self.status is not None:
            result["status"] = from_union([from_int, from_none], self.status)
        if self.uid is not None:
            result["uid"] = from_union([from_str, from_none], self.uid)
        if self.type is not None:
            result["type"] = from_union([from_str, from_none], self.type)
        if self.event_date is not None:
            result["event_date"] = from_union([from_str, from_none], self.event_date)
        if self.event_type is not None:
            result["event_type"] = from_union([from_str, from_none], self.event_type)
        if self.city is not None:
            result["city"] = from_union([from_int, from_none], self.city)
        if self.selected_reason is not None:
            result["selected_reason"] = from_union([from_int, from_none], self.selected_reason)
        return result


def request_callback_model_from_dict(s: Any) -> RequestCallbackModel:
    return RequestCallbackModel.from_dict(s)


def request_callback_model_to_dict(x: RequestCallbackModel) -> Any:
    return to_class(RequestCallbackModel, x)
