from dataclasses import dataclass
from typing import Any, TypeVar, Type, cast


T = TypeVar("T")


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def from_int(x: Any) -> int:
    assert isinstance(x, int) and not isinstance(x, bool)
    return x


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


@dataclass
class TrackOrderModel:
    uid: str
    event_id: int

    @staticmethod
    def from_dict(obj: Any) -> 'TrackOrderModel':
        assert isinstance(obj, dict)
        uid = from_str(obj.get("uid"))
        event_id = from_int(obj.get("event_id"))
        return TrackOrderModel(uid, event_id)

    def to_dict(self) -> dict:
        result: dict = {}
        result["uid"] = from_str(self.uid)
        result["event_id"] = from_int(self.event_id)
        return result


def track_order_model_from_dict(s: Any) -> TrackOrderModel:
    return TrackOrderModel.from_dict(s)


def track_order_model_to_dict(x: TrackOrderModel) -> Any:
    return to_class(TrackOrderModel, x)
