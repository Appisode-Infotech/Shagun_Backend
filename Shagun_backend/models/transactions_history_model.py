from dataclasses import dataclass
from typing import Any, TypeVar, Type, cast


T = TypeVar("T")


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def from_int(x: Any) -> int:
    assert isinstance(x, int) and not isinstance(x, bool)
    return x


def from_float(x: Any) -> float:
    assert isinstance(x, (float, int)) and not isinstance(x, bool)
    return float(x)


def from_bool(x: Any) -> bool:
    assert isinstance(x, bool)
    return x


def to_float(x: Any) -> float:
    assert isinstance(x, float)
    return x


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


@dataclass
class TransactionsHistoryModel:
    receiver_uid: str
    event_id: int
    wish: str
    greeting_card_id: int
    greeting_card_price: float
    transaction_id: str
    payment_status: str
    delivery_fee: float
    transaction_fee: float
    service_charge: float
    shagun_amount: float
    transaction_amount: float
    status: bool
    gifter_name: str
    uid: str

    @staticmethod
    def from_dict(obj: Any) -> 'TransactionsHistoryModel':
        assert isinstance(obj, dict)
        receiver_uid = from_str(obj.get("receiver_uid"))
        event_id = from_int(obj.get("event_id"))
        wish = from_str(obj.get("wish"))
        greeting_card_id = from_int(obj.get("greeting_card_id"))
        greeting_card_price = from_float(obj.get("greeting_card_price"))
        transaction_id = from_str(obj.get("transaction_id"))
        payment_status = from_str(obj.get("payment_status"))
        delivery_fee = from_float(obj.get("delivery_fee"))
        transaction_fee = from_float(obj.get("transaction_fee"))
        service_charge = from_float(obj.get("service_charge"))
        shagun_amount = from_float(obj.get("shagun_amount"))
        transaction_amount = from_float(obj.get("transaction_amount"))
        status = from_bool(obj.get("status"))
        gifter_name = from_str(obj.get("gifter_name"))
        uid = from_str(obj.get("uid"))
        return TransactionsHistoryModel(receiver_uid, event_id, wish, greeting_card_id, greeting_card_price, transaction_id, payment_status, delivery_fee, transaction_fee, service_charge, shagun_amount, transaction_amount, status, gifter_name, uid)

    def to_dict(self) -> dict:
        result: dict = {}
        result["receiver_uid"] = from_str(self.receiver_uid)
        result["event_id"] = from_int(self.event_id)
        result["wish"] = from_str(self.wish)
        result["greeting_card_id"] = from_int(self.greeting_card_id)
        result["greeting_card_price"] = to_float(self.greeting_card_price)
        result["transaction_id"] = from_str(self.transaction_id)
        result["payment_status"] = from_str(self.payment_status)
        result["delivery_fee"] = to_float(self.delivery_fee)
        result["transaction_fee"] = to_float(self.transaction_fee)
        result["service_charge"] = to_float(self.service_charge)
        result["shagun_amount"] = to_float(self.shagun_amount)
        result["transaction_amount"] = to_float(self.transaction_amount)
        result["status"] = from_bool(self.status)
        result["gifter_Name"] = from_str(self.gifter_name)
        result["uid"] = from_str(self.uid)
        return result


def transactions_history_model_from_dict(s: Any) -> TransactionsHistoryModel:
    return TransactionsHistoryModel.from_dict(s)


def transactions_history_model_to_dict(x: TransactionsHistoryModel) -> Any:
    return to_class(TransactionsHistoryModel, x)
