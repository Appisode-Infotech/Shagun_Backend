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
class BankModel:
    id: Optional[int] = None
    bank_name: Optional[str] = None
    bank_logo: Optional[str] = None
    status: Optional[int] = None
    created_on: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'BankModel':
        assert isinstance(obj, dict)
        id = from_union([from_int, from_none], obj.get("id"))
        bank_name = from_union([from_str, from_none], obj.get("bank_name"))
        bank_logo = from_union([from_str, from_none], obj.get("bank_logo"))
        status = from_union([from_int, from_none], obj.get("status"))
        created_on = from_union([from_str, from_none], obj.get("created_on"))
        return BankModel(id, bank_name, bank_logo, status, created_on)

    def to_dict(self) -> dict:
        result: dict = {}
        if self.id is not None:
            result["id"] = from_union([from_int, from_none], self.id)
        if self.bank_name is not None:
            result["bank_name"] = from_union([from_str, from_none], self.bank_name)
        if self.bank_logo is not None:
            result["bank_logo"] = from_union([from_str, from_none], self.bank_logo)
        if self.status is not None:
            result["status"] = from_union([from_int, from_none], self.status)
        if self.created_on is not None:
            result["created_on"] = from_union([from_str, from_none], self.created_on)
        return result


def bank_model_from_dict(s: Any) -> BankModel:
    return BankModel.from_dict(s)


def bank_model_to_dict(x: BankModel) -> Any:
    return to_class(BankModel, x)