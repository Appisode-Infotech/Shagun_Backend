from dataclasses import dataclass
from typing import Optional, Any, TypeVar, Type, cast

T = TypeVar("T")


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


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


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


@dataclass
class UserKycModel:
    uid: str
    full_name: str
    gender: str
    dob: str
    identification_proof1: str
    identification_number1: str
    identification_proof2: str
    identification_number2: str
    adress1: str
    state: str
    adress2: str
    postcode: str
    city: str
    country: str
    identification_doc1: Optional[str] = None
    identification_doc2: Optional[str] = None
    id: Optional[str] = None
    created_by_uid: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'UserKycModel':
        assert isinstance(obj, dict)
        uid = from_str(obj.get("uid"))
        full_name = from_str(obj.get("full_name"))
        gender = from_str(obj.get("gender"))
        dob = from_str(obj.get("dob"))
        identification_proof1 = from_str(obj.get("identification_proof1"))
        identification_number1 = from_str(obj.get("identification_number1"))
        identification_proof2 = from_str(obj.get("identification_proof2"))
        identification_number2 = from_str(obj.get("identification_number2"))
        adress1 = from_str(obj.get("adress1"))
        state = from_str(obj.get("state"))
        adress2 = from_str(obj.get("adress2"))
        postcode = from_str(obj.get("postcode"))
        city = from_str(obj.get("city"))
        identification_doc1 = from_union([from_str, from_none], obj.get("identification_doc1"))
        identification_doc2 = from_union([from_str, from_none], obj.get("identification_doc2"))
        created_by_uid = from_union([from_str, from_none], obj.get("created_by_uid"))
        id = from_union([from_str, from_none], obj.get("id"))
        country = from_str(obj.get("country"))
        return UserKycModel(uid, full_name, gender, dob, identification_proof1, identification_number1,
                            identification_proof2, identification_number2, adress1, state, adress2, postcode, city,
                            country, identification_doc1, identification_doc2, id, created_by_uid)

    def to_dict(self) -> dict:
        result: dict = {}
        result["uid"] = from_str(self.uid)
        result["full_name"] = from_str(self.full_name)
        result["gender"] = from_str(self.gender)
        result["dob"] = from_str(self.dob)
        result["identification_proof1"] = from_str(self.identification_proof1)
        result["identification_number1"] = from_str(self.identification_number1)
        result["identification_proof2"] = from_str(self.identification_proof2)
        result["identification_number2"] = from_str(self.identification_number2)
        result["adress1"] = from_str(self.adress1)
        result["state"] = from_str(self.state)
        result["adress2"] = from_str(self.adress2)
        result["postcode"] = from_str(self.postcode)
        result["city"] = from_str(self.city)
        if self.identification_doc1 is not None:
            result["identification_doc1"] = from_union([from_str, from_none], self.identification_doc1)
        if self.identification_doc2 is not None:
            result["identification_doc2"] = from_union([from_str, from_none], self.identification_doc2)
        result["country"] = from_str(self.country)
        if self.id is not None:
            result["id"] = from_union([from_str, from_none], self.id)
        if self.created_by_uid is not None:
            result["created_by_uid"] = from_union([from_str, from_none], self.created_by_uid)
        return result


def user_kyc_model_from_dict(s: Any) -> UserKycModel:
    return UserKycModel.from_dict(s)


def user_kyc_model_to_dict(x: UserKycModel) -> Any:
    return to_class(UserKycModel, x)
