from dataclasses import dataclass
from typing import Optional, Any, TypeVar, Type, cast


T = TypeVar("T")


def from_str(x: Any) -> str:
    assert isinstance(x, str)
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


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


@dataclass
class GiftsTransactionModel:
    uid: Optional[str] = None
    type: Optional[str] = None
    month: Optional[str] = None
    search: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'GiftsTransactionModel':
        assert isinstance(obj, dict)
        uid = from_union([from_str, from_none], obj.get("uid"))
        type = from_union([from_str, from_none], obj.get("type"))
        month = from_union([from_str, from_none], obj.get("month"))
        search = from_union([from_str, from_none], obj.get("search"))
        return GiftsTransactionModel(uid, type, month, search)

    def to_dict(self) -> dict:
        result: dict = {}
        if self.uid is not None:
            result["uid"] = from_union([from_str, from_none], self.uid)
        if self.type is not None:
            result["type"] = from_union([from_str, from_none], self.type)
        if self.month is not None:
            result["month"] = from_union([from_str, from_none], self.month)
        if self.search is not None:
            result["search"] = from_union([from_str, from_none], self.search)
        return result


def gifts_transaction_model_from_dict(s: Any) -> GiftsTransactionModel:
    return GiftsTransactionModel.from_dict(s)


def gifts_transaction_model_to_dict(x: GiftsTransactionModel) -> Any:
    return to_class(GiftsTransactionModel, x)
