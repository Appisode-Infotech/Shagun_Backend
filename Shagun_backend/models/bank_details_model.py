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
class BankDetailsModel:
    uid: str
    bank_name: str
    ifsc_code: str
    account_holder_name: str
    account_number: str
    added_by: Optional[str] = None
    modified_by: Optional[str] = None
    bank_id: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'BankDetailsModel':
        assert isinstance(obj, dict)
        uid = from_str(obj.get("uid"))
        bank_name = from_str(obj.get("bank_name"))
        ifsc_code = from_str(obj.get("ifsc_code"))
        account_holder_name = from_str(obj.get("account_holder_name"))
        account_number = from_str(obj.get("account_number"))
        added_by = from_union([from_str, from_none], obj.get("added_by"))
        modified_by = from_union([from_str, from_none], obj.get("modified_by"))
        bank_id = from_union([from_str, from_none], obj.get("bank_id"))
        return BankDetailsModel(uid, bank_name, ifsc_code, account_holder_name, account_number, added_by, modified_by,bank_id)

    def to_dict(self) -> dict:
        result: dict = {}
        result["uid"] = from_str(self.uid)
        result["bank_name"] = from_str(self.bank_name)
        result["ifsc_code"] = from_str(self.ifsc_code)
        result["account_holder_name"] = from_str(self.account_holder_name)
        result["account_number"] = from_str(self.account_number)
        if self.added_by is not None:
            result["added_by"] = from_union([from_str, from_none], self.added_by)
        if self.modified_by is not None:
            result["modified_by"] = from_union([from_str, from_none], self.modified_by)
        if self.bank_id is not None:
            result["bank_id"] = from_union([from_str, from_none], self.bank_id)
        return result


def bank_details_model_from_dict(s: Any) -> BankDetailsModel:
    return BankDetailsModel.from_dict(s)


def bank_details_model_to_dict(x: BankDetailsModel) -> Any:
    return to_class(BankDetailsModel, x)
