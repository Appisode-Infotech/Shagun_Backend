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
class GiftsTransactionModel:
    uid: str
    type: str
    month: str

    @staticmethod
    def from_dict(obj: Any) -> 'GiftsTransactionModel':
        assert isinstance(obj, dict)
        uid = from_str(obj.get("uid"))
        type = from_str(obj.get("type"))
        month = from_str(obj.get("month"))
        return GiftsTransactionModel(uid, type, month)

    def to_dict(self) -> dict:
        result: dict = {}
        result["uid"] = from_str(self.uid)
        result["type"] = from_str(self.type)
        result["month"] = from_str(self.month)
        return result


def gifts_transaction_model_from_dict(s: Any) -> GiftsTransactionModel:
    return GiftsTransactionModel.from_dict(s)


def gifts_transaction_model_to_dict(x: GiftsTransactionModel) -> Any:
    return to_class(GiftsTransactionModel, x)
