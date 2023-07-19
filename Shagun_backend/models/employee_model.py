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
class AddEmployeeModel:
    email: str
    name: str
    phone: str
    password: str
    city: str

    @staticmethod
    def from_dict(obj: Any) -> 'AddEmployeeModel':
        assert isinstance(obj, dict)
        email = from_str(obj.get("email"))
        name = from_str(obj.get("name"))
        phone = from_str(obj.get("phone"))
        password = from_str(obj.get("password"))
        city = from_str(obj.get("city"))
        return AddEmployeeModel(email, name, phone, password, city)

    def to_dict(self) -> dict:
        result: dict = {}
        result["email"] = from_str(self.email)
        result["name"] = from_str(self.name)
        result["phone"] = from_str(self.phone)
        result["password"] = from_str(self.password)
        result["city"] = from_str(self.city)
        return result


def add_employee_model_from_dict(s: Any) -> AddEmployeeModel:
    return AddEmployeeModel.from_dict(s)


def add_employee_model_to_dict(x: AddEmployeeModel) -> Any:
    return to_class(AddEmployeeModel, x)
