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
class AddEmployeeModel:
    email: Optional[str] = None
    name: Optional[str] = None
    phone: Optional[str] = None
    password: Optional[str] = None
    city: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'AddEmployeeModel':
        assert isinstance(obj, dict)
        email = from_union([from_str, from_none], obj.get("email"))
        name = from_union([from_str, from_none], obj.get("name"))
        phone = from_union([from_str, from_none], obj.get("phone"))
        password = from_union([from_str, from_none], obj.get("password"))
        city = from_union([from_str, from_none], obj.get("city"))
        return AddEmployeeModel(email, name, phone, password, city)

    def to_dict(self) -> dict:
        result: dict = {}
        if self.email is not None:
            result["email"] = from_union([from_str, from_none], self.email)
        if self.name is not None:
            result["name"] = from_union([from_str, from_none], self.name)
        if self.phone is not None:
            result["phone"] = from_union([from_str, from_none], self.phone)
        if self.password is not None:
            result["password"] = from_union([from_str, from_none], self.password)
        if self.city is not None:
            result["city"] = from_union([from_str, from_none], self.city)
        return result


def add_employee_model_from_dict(s: Any) -> AddEmployeeModel:
    return AddEmployeeModel.from_dict(s)


def add_employee_model_to_dict(x: AddEmployeeModel) -> Any:
    return to_class(AddEmployeeModel, x)
