from dataclasses import dataclass
from typing import Optional, Any, TypeVar, Type, cast


T = TypeVar("T")


def from_none(x: Any) -> Any:
    assert x is None
    return x


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def from_union(fs, x):
    for f in fs:
        try:
            return f(x)
        except:
            pass
    assert False


def is_type(t: Type[T], x: Any) -> T:
    assert isinstance(x, t)
    return x


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


@dataclass
class AddVendorModel:
    id: Optional[int] = None
    delivery_vendor_name: Optional[str] = None
    city: Optional[str] = None
    address: Optional[str] = None
    gst_no: Optional[str] = None
    delivery_vendor_owner: Optional[str] = None
    contact_number: Optional[str] = None
    created_by: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'AddVendorModel':
        assert isinstance(obj, dict)
        id = from_union([from_none, lambda x: int(from_str(x))], obj.get("id"))
        delivery_vendor_name = from_union([from_str, from_none], obj.get("delivery_vendor_name"))
        city = from_union([from_str, from_none], obj.get("city"))
        address = from_union([from_str, from_none], obj.get("address"))
        gst_no = from_union([from_str, from_none], obj.get("gst_no"))
        delivery_vendor_owner = from_union([from_str, from_none], obj.get("delivery_vendor_owner"))
        contact_number = from_union([from_str, from_none], obj.get("contact_number"))
        created_by = from_union([from_str, from_none], obj.get("created_by"))
        return AddVendorModel(id, delivery_vendor_name, city, address, gst_no, delivery_vendor_owner, contact_number, created_by)

    def to_dict(self) -> dict:
        result: dict = {}
        if self.id is not None:
            result["id"] = from_union([lambda x: from_none((lambda x: is_type(type(None), x))(x)), lambda x: from_str((lambda x: str((lambda x: is_type(int, x))(x)))(x))], self.id)
        if self.delivery_vendor_name is not None:
            result["delivery_vendor_name"] = from_union([from_str, from_none], self.delivery_vendor_name)
        if self.city is not None:
            result["city"] = from_union([from_str, from_none], self.city)
        if self.address is not None:
            result["address"] = from_union([from_str, from_none], self.address)
        if self.gst_no is not None:
            result["gst_no"] = from_union([from_str, from_none], self.gst_no)
        if self.delivery_vendor_owner is not None:
            result["delivery_vendor_owner"] = from_union([from_str, from_none], self.delivery_vendor_owner)
        if self.contact_number is not None:
            result["contact_number"] = from_union([from_str, from_none], self.contact_number)
        if self.created_by is not None:
            result["created_by"] = from_union([from_str, from_none], self.created_by)
        return result


def add_vendor_model_from_dict(s: Any) -> AddVendorModel:
    return AddVendorModel.from_dict(s)


def add_vendor_model_to_dict(x: AddVendorModel) -> Any:
    return to_class(AddVendorModel, x)
