from dataclasses import dataclass
from typing import Any, List, TypeVar, Callable, Type, cast


T = TypeVar("T")


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def from_int(x: Any) -> int:
    assert isinstance(x, int) and not isinstance(x, bool)
    return x


def from_list(f: Callable[[Any], T], x: Any) -> List[T]:
    assert isinstance(x, list)
    return [f(y) for y in x]


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


@dataclass
class EventAdmin:
    name: str
    role: str
    profile: str
    qr_code: str

    @staticmethod
    def from_dict(obj: Any) -> 'EventAdmin':
        assert isinstance(obj, dict)
        name = from_str(obj.get("name"))
        role = from_str(obj.get("role"))
        profile = from_str(obj.get("profile"))
        qr_code = from_str(obj.get("QR_code"))
        return EventAdmin(name, role, profile, qr_code)

    def to_dict(self) -> dict:
        result: dict = {}
        result["name"] = from_str(self.name)
        result["role"] = from_str(self.role)
        result["profile"] = from_str(self.profile)
        result["QR_code"] = from_str(self.qr_code)
        return result


@dataclass
class SubEvent:
    sub_event_name: str
    start: str
    end: str

    @staticmethod
    def from_dict(obj: Any) -> 'SubEvent':
        assert isinstance(obj, dict)
        sub_event_name = from_str(obj.get("sub_event_name"))
        start = from_str(obj.get("start"))
        end = from_str(obj.get("end"))
        return SubEvent(sub_event_name, start, end)

    def to_dict(self) -> dict:
        result: dict = {}
        result["sub_event_name"] = from_str(self.sub_event_name)
        result["start"] = from_str(self.start)
        result["end"] = from_str(self.end)
        return result


@dataclass
class CreateEventModel:
    created_by_uid: str
    event_type_id: int
    city_id: int
    address_line1: str
    address_line2: str
    event_lat_lng: str
    sub_events: List[SubEvent]
    event_date: str
    event_note: str
    event_admin: List[EventAdmin]

    @staticmethod
    def from_dict(obj: Any) -> 'CreateEventModel':
        assert isinstance(obj, dict)
        created_by_uid = from_str(obj.get("created_by_uid"))
        event_type_id = from_int(obj.get("event_type_id"))
        city_id = from_int(obj.get("city_id"))
        address_line1 = from_str(obj.get("address_line1"))
        address_line2 = from_str(obj.get("address_line2"))
        event_lat_lng = from_str(obj.get("event_lat_lng"))
        sub_events = from_list(SubEvent.from_dict, obj.get("sub_events"))
        event_date = from_str(obj.get("event_date"))
        event_note = from_str(obj.get("event_note"))
        event_admin = from_list(EventAdmin.from_dict, obj.get("event_admin"))
        return CreateEventModel(created_by_uid, event_type_id, city_id, address_line1, address_line2, event_lat_lng,
                                sub_events, event_date, event_note, event_admin)

    def to_dict(self) -> dict:
        result: dict = {}
        result["created_by_uid"] = from_str(self.created_by_uid)
        result["event_type_id"] = from_int(self.event_type_id)
        result["city_id"] = from_int(self.city_id)
        result["address_line1"] = from_str(self.address_line1)
        result["address_line2"] = from_str(self.address_line2)
        result["event_lat_lng"] = from_str(self.event_lat_lng)
        result["sub_events"] = from_list(lambda x: to_class(SubEvent, x), self.sub_events)
        result["event_date"] = from_str(self.event_date)
        result["event_note"] = from_str(self.event_note)
        result["event_admin"] = from_list(lambda x: to_class(EventAdmin, x), self.event_admin)
        return result


def create_event_model_from_dict(s: Any) -> CreateEventModel:
    return CreateEventModel.from_dict(s)


def create_event_model_to_dict(x: CreateEventModel) -> Any:
    return to_class(CreateEventModel, x)
