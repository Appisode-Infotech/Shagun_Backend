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
class BankDetailsModel:
    uid: str
    bank_name: str
    ifsc_code: str
    account_holder_name: str
    account_number: str
    added_by: str

    @staticmethod
    def from_dict(obj: Any) -> 'BankDetailsModel':
        assert isinstance(obj, dict)
        uid = from_str(obj.get("uid"))
        bank_name = from_str(obj.get("bank_name"))
        ifsc_code = from_str(obj.get("ifsc_code"))
        account_holder_name = from_str(obj.get("account_holder_name"))
        account_number = from_str(obj.get("account_number"))
        added_by = from_str(obj.get("added_by"))
        return BankDetailsModel(uid, bank_name, ifsc_code, account_holder_name, account_number, added_by)

    def to_dict(self) -> dict:
        result: dict = {}
        result["uid"] = from_str(self.uid)
        result["bank_name"] = from_str(self.bank_name)
        result["ifsc_code"] = from_str(self.ifsc_code)
        result["account_holder_name"] = from_str(self.account_holder_name)
        result["account_number"] = from_str(self.account_number)
        result["added_by"] = from_str(self.added_by)
        return result


def bank_details_model_from_dict(s: Any) -> BankDetailsModel:
    return BankDetailsModel.from_dict(s)


def bank_details_model_to_dict(x: BankDetailsModel) -> Any:
    return to_class(BankDetailsModel, x)
