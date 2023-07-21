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
class UserKycModel:
    uid: str
    full_name: str
    dob: str
    permanent_address: str
    identification_proof1: str
    identification_proof2: str
    identification_number1: str
    identification_number2: str
    # identification_doc1: str
    # identification_doc2: str

    @staticmethod
    def from_dict(obj: Any) -> 'UserKycModel':
        assert isinstance(obj, dict)
        uid = from_str(obj.get("uid"))
        full_name = from_str(obj.get("full_name"))
        dob = from_str(obj.get("dob"))
        permanent_address = from_str(obj.get("permanent_address"))
        identification_proof1 = from_str(obj.get("identification_proof1"))
        identification_proof2 = from_str(obj.get("identification_proof2"))
        identification_number1 = from_str(obj.get("identification_number1"))
        identification_number2 = from_str(obj.get("identification_number2"))
        # identification_doc1 = from_str(obj.get("identification_doc1"))
        # identification_doc2 = from_str(obj.get("identification_doc2"))
        return UserKycModel(uid, full_name, dob, permanent_address, identification_proof1, identification_proof2,
                            identification_number1, identification_number2)

    def to_dict(self) -> dict:
        result: dict = {}
        result["uid"] = from_str(self.uid)
        result["full_name"] = from_str(self.full_name)
        result["dob"] = from_str(self.dob)
        result["permanent_address"] = from_str(self.permanent_address)
        result["identification_proof1"] = from_str(self.identification_proof1)
        result["identification_proof2"] = from_str(self.identification_proof2)
        result["identification_number1"] = from_str(self.identification_number1)
        result["identification_number2"] = from_str(self.identification_number2)
        # result["identification_doc1"] = from_str(self.identification_doc1)
        # result["identification_doc2"] = from_str(self.identification_doc2)
        return result


def user_kyc_model_from_dict(s: Any) -> UserKycModel:
    return UserKycModel.from_dict(s)


def user_kyc_model_to_dict(x: UserKycModel) -> Any:
    return to_class(UserKycModel, x)
