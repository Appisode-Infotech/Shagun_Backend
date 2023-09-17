from dataclasses import dataclass
from typing import Optional, Any, List, TypeVar, Callable, Type, cast


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


def from_list(f: Callable[[Any], T], x: Any) -> List[T]:
    assert isinstance(x, list)
    return [f(y) for y in x]


def is_type(t: Type[T], x: Any) -> T:
    assert isinstance(x, t)
    return x


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


@dataclass
class EventAdmin:
    name: Optional[str] = None
    role: Optional[str] = None
    uid: Optional[str] = None
    profile: Optional[str] = None
    qr_code: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'EventAdmin':
        assert isinstance(obj, dict)
        name = from_union([from_str, from_none], obj.get("name"))
        role = from_union([from_str, from_none], obj.get("role"))
        uid = from_union([from_str, from_none], obj.get("uid"))
        profile = from_union([from_str, from_none], obj.get("profile"))
        qr_code = from_union([from_str, from_none], obj.get("QR_code"))
        return EventAdmin(name, role, uid, profile, qr_code)

    def to_dict(self) -> dict:
        result: dict = {}
        if self.name is not None:
            result["name"] = from_union([from_str, from_none], self.name)
        if self.role is not None:
            result["role"] = from_union([from_str, from_none], self.role)
        if self.uid is not None:
            result["uid"] = from_union([from_str, from_none], self.uid)
        if self.profile is not None:
            result["profile"] = from_union([from_str, from_none], self.profile)
        if self.qr_code is not None:
            result["QR_code"] = from_union([from_str, from_none], self.qr_code)
        return result


@dataclass
class SubEvent:
    sub_event_name: Optional[str] = None
    start_time: Optional[str] = None
    end_time: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'SubEvent':
        assert isinstance(obj, dict)
        sub_event_name = from_union([from_str, from_none], obj.get("sub_event_name"))
        start_time = from_union([from_str, from_none], obj.get("start_time"))
        end_time = from_union([from_str, from_none], obj.get("end_time"))
        return SubEvent(sub_event_name, start_time, end_time)

    def to_dict(self) -> dict:
        result: dict = {}
        if self.sub_event_name is not None:
            result["sub_event_name"] = from_union([from_str, from_none], self.sub_event_name)
        if self.start_time is not None:
            result["start_time"] = from_union([from_str, from_none], self.start_time)
        if self.end_time is not None:
            result["end_time"] = from_union([from_str, from_none], self.end_time)
        return result


@dataclass
class CreateEventModel:
    event_type_id: Optional[int] = None
    city_id: Optional[int] = None
    printer_id: Optional[int] = None
    delivery_fee: Optional[int] = None
    created_by_uid: Optional[str] = None
    address_line1: Optional[str] = None
    address_line2: Optional[str] = None
    event_lat_lng: Optional[str] = None
    sub_events: Optional[List[SubEvent]] = None
    event_date: Optional[str] = None
    event_note: Optional[str] = None
    event_admin: Optional[List[EventAdmin]] = None
    delivery_address: Optional[str] = None

    @staticmethod
    def from_dict(obj: Any) -> 'CreateEventModel':
        assert isinstance(obj, dict)
        event_type_id = from_union([from_none, lambda x: int(from_str(x))], obj.get("event_type_id"))
        city_id = from_union([from_none, lambda x: int(from_str(x))], obj.get("city_id"))
        printer_id = from_union([from_none, lambda x: int(from_str(x))], obj.get("printer_id"))
        delivery_fee = from_union([from_none, lambda x: int(from_str(x))], obj.get("delivery_fee"))
        created_by_uid = from_union([from_str, from_none], obj.get("created_by_uid"))
        address_line1 = from_union([from_str, from_none], obj.get("address_line1"))
        address_line2 = from_union([from_str, from_none], obj.get("address_line2"))
        event_lat_lng = from_union([from_str, from_none], obj.get("event_lat_lng"))
        sub_events = from_union([lambda x: from_list(SubEvent.from_dict, x), from_none], obj.get("sub_events"))
        event_date = from_union([from_str, from_none], obj.get("event_date"))
        event_note = from_union([from_str, from_none], obj.get("event_note"))
        event_admin = from_union([lambda x: from_list(EventAdmin.from_dict, x), from_none], obj.get("event_admin"))
        delivery_address = from_union([from_str, from_none], obj.get("delivery_address"))
        return CreateEventModel(event_type_id, city_id, printer_id, delivery_fee, created_by_uid, address_line1, address_line2, event_lat_lng, sub_events, event_date, event_note, event_admin, delivery_address)

    def to_dict(self) -> dict:
        result: dict = {}
        if self.event_type_id is not None:
            result["event_type_id"] = from_union([lambda x: from_none((lambda x: is_type(type(None), x))(x)), lambda x: from_str((lambda x: str((lambda x: is_type(int, x))(x)))(x))], self.event_type_id)
        if self.city_id is not None:
            result["city_id"] = from_union([lambda x: from_none((lambda x: is_type(type(None), x))(x)), lambda x: from_str((lambda x: str((lambda x: is_type(int, x))(x)))(x))], self.city_id)
        if self.printer_id is not None:
            result["printer_id"] = from_union([lambda x: from_none((lambda x: is_type(type(None), x))(x)), lambda x: from_str((lambda x: str((lambda x: is_type(int, x))(x)))(x))], self.printer_id)
        if self.delivery_fee is not None:
            result["delivery_fee"] = from_union([lambda x: from_none((lambda x: is_type(type(None), x))(x)), lambda x: from_str((lambda x: str((lambda x: is_type(int, x))(x)))(x))], self.delivery_fee)
        if self.created_by_uid is not None:
            result["created_by_uid"] = from_union([from_str, from_none], self.created_by_uid)
        if self.address_line1 is not None:
            result["address_line1"] = from_union([from_str, from_none], self.address_line1)
        if self.address_line2 is not None:
            result["address_line2"] = from_union([from_str, from_none], self.address_line2)
        if self.event_lat_lng is not None:
            result["event_lat_lng"] = from_union([from_str, from_none], self.event_lat_lng)
        if self.sub_events is not None:
            result["sub_events"] = from_union([lambda x: from_list(lambda x: to_class(SubEvent, x), x), from_none], self.sub_events)
        if self.event_date is not None:
            result["event_date"] = from_union([from_str, from_none], self.event_date)
        if self.event_note is not None:
            result["event_note"] = from_union([from_str, from_none], self.event_note)
        if self.event_admin is not None:
            result["event_admin"] = from_union([lambda x: from_list(lambda x: to_class(EventAdmin, x), x), from_none], self.event_admin)
        if self.delivery_address is not None:
            result["delivery_address"] = from_union([from_str, from_none], self.delivery_address)
        return result


def create_event_model_from_dict(s: Any) -> CreateEventModel:
    return CreateEventModel.from_dict(s)


def create_event_model_to_dict(x: CreateEventModel) -> Any:
    return to_class(CreateEventModel, x)
