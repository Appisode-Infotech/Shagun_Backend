from dataclasses import dataclass
from typing import Any, TypeVar, Type, cast


T = TypeVar("T")


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


@dataclass
class GiftsSentModel:
    uid: str
    month: str
    event_type_name: str

    @staticmethod
    def from_dict(obj: Any) -> 'GiftsSentModel':
        assert isinstance(obj, dict)
        uid = from_str(obj.get("uid"))
        month = from_str(obj.get("month"))
        event_type_name = from_str(obj.get("event_type_name"))
        return GiftsSentModel(uid, month, event_type_name)

    def to_dict(self) -> dict:
        result: dict = {}
        result["uid"] = from_str(self.uid)
        result["month"] = from_str(self.month)
        result["event_type_name"] = from_str(self.event_type_name)
        return result


def gifts_sent_model_from_dict(s: Any) -> GiftsSentModel:
    return GiftsSentModel.from_dict(s)


def gifts_sent_model_to_dict(x: GiftsSentModel) -> Any:
    return to_class(GiftsSentModel, x)
