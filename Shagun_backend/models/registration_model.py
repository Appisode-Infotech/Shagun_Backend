from dataclasses import dataclass
from typing import Optional, Any, TypeVar, Type, cast

T = TypeVar("T")


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x

def from_int(x: Any) -> int:
    assert isinstance(x, int) and not isinstance(x, bool)
    return x

def from_union(fs, x):
    for f in fs:
        try:
            return f(x)
        except:
            pass
    assert False

def from_none(x: Any) -> Any:
    assert x is None
    return x

def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


@dataclass
class RegistrationModel:
    uid: str
    name: str
    email: str
    phone: str
    profile: str
    auth_type: Optional[str] = None
    role: Optional[int] = None

    @staticmethod
    def from_dict(obj: Any) -> 'RegistrationModel':
        assert isinstance(obj, dict)
        uid = from_str(obj.get("uid"))
        name = from_str(obj.get("name"))
        email = from_str(obj.get("email"))
        phone = from_str(obj.get("phone"))
        profile = from_str(obj.get("profile"))
        auth_type = from_union([from_str, from_none], obj.get("auth_type"))
        role = from_union([from_int, from_none], obj.get("role"))
        return RegistrationModel(uid, name, email, phone, profile, auth_type, role)

    def to_dict(self) -> dict:
        result: dict = {}
        result["uid"] = from_str(self.uid)
        result["name"] = from_str(self.name)
        result["email"] = from_str(self.email)
        result["phone"] = from_str(self.phone)
        result["profile"] = from_str(self.profile)
        if self.auth_type is not None:
            result["auth_type"] = from_union([from_str, from_none], self.auth_type)
        if self.role is not None:
            result["role"] = from_union([from_int, from_none], self.role)
        return result


def registration_model_from_dict(s: Any) -> RegistrationModel:
    return RegistrationModel.from_dict(s)


def registration_model_to_dict(x: RegistrationModel) -> Any:
    return to_class(RegistrationModel, x)
