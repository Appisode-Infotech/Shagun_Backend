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
class AddVendorModel:
    delivery_vendor_name: str
    city: str
    address: str
    gst_no: str
    delivery_vendor_owner: str
    contact_number: str
    created_by: str

    @staticmethod
    def from_dict(obj: Any) -> 'AddVendorModel':
        assert isinstance(obj, dict)
        delivery_vendor_name = from_str(obj.get("delivery_vendor_name"))
        city = from_str(obj.get("city"))
        address = from_str(obj.get("address"))
        gst_no = from_str(obj.get("gst_no"))
        delivery_vendor_owner = from_str(obj.get("delivery_vendor_owner"))
        contact_number = from_str(obj.get("contact_number"))
        created_by = from_str(obj.get("created_by"))
        return AddVendorModel(delivery_vendor_name, city, address, gst_no, delivery_vendor_owner, contact_number, created_by)

    def to_dict(self) -> dict:
        result: dict = {}
        result["delivery_vendor_name"] = from_str(self.delivery_vendor_name)
        result["city"] = from_str(self.city)
        result["address"] = from_str(self.address)
        result["gst_no"] = from_str(self.gst_no)
        result["delivery_vendor_owner"] = from_str(self.delivery_vendor_owner)
        result["contact_number"] = from_str(self.contact_number)
        result["created_by"] = from_str(self.created_by)
        return result


def add_vendor_model_from_dict(s: Any) -> AddVendorModel:
    return AddVendorModel.from_dict(s)


def add_vendor_model_to_dict(x: AddVendorModel) -> Any:
    return to_class(AddVendorModel, x)
