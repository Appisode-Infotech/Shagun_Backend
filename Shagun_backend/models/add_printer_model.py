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


def from_int(x: Any) -> int:
    assert isinstance(x, int) and not isinstance(x, bool)
    return x


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


@dataclass
class AddPrinterModel:
    store_name: str
    city: str
    address: str
    email: str
    gst_no: str
    store_owner: str
    contact_number: str
    printer_user_name: Optional[str] = None
    printer_password: Optional[str] = None
    store_id: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'AddPrinterModel':
        assert isinstance(obj, dict)
        store_name = from_str(obj.get("store_name"))
        city = from_str(obj.get("city"))
        address = from_str(obj.get("address"))
        email = from_str(obj.get("email"))
        gst_no = from_str(obj.get("gst_no"))
        store_owner = from_str(obj.get("store_owner"))
        contact_number = from_str(obj.get("contact_number"))
        printer_user_name = from_union([from_str, from_none], obj.get("printer_user_name"))
        printer_password = from_union([from_str, from_none], obj.get("printer_password"))
        store_id = from_union([from_str, from_none], obj.get("store_id"))
        return AddPrinterModel(store_name, city, address, email, gst_no, store_owner, contact_number,
                               printer_user_name, printer_password, store_id)

    def to_dict(self) -> dict:
        result: dict = {}
        result["store_name"] = from_str(self.store_name)
        result["city"] = from_str(self.city)
        result["address"] = from_str(self.address)
        result["email"] = from_str(self.email)
        result["gst_no"] = from_str(self.gst_no)
        result["store_owner"] = from_str(self.store_owner)
        result["contact_number"] = from_str(self.contact_number)
        if self.printer_user_name is not None:
            result["printer_user_name"] = from_union([from_str, from_none], self.printer_user_name)
        if self.printer_password is not None:
            result["printer_password"] = from_union([from_str, from_none], self.printer_password)
        if self.store_id is not None:
            result["store_id"] = from_union([from_str, from_none], self.store_id)
        return result


def add_printer_model_from_dict(s: Any) -> AddPrinterModel:
    return AddPrinterModel.from_dict(s)


def add_printer_model_to_dict(x: AddPrinterModel) -> Any:
    return to_class(AddPrinterModel, x)
