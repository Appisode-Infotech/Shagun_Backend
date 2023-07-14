from dataclasses import dataclass
from typing import Any, TypeVar, Type, cast


T = TypeVar("T")


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def from_float(x: Any) -> float:
    assert isinstance(x, (float, int)) and not isinstance(x, bool)
    return float(x)


def from_int(x: Any) -> int:
    assert isinstance(x, int) and not isinstance(x, bool)
    return x


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
    sender_uid: str
    receiver_uid: str
    transaction_amount: float
    shagun_amount: float
    greeting_card_id: int
    transaction_fee: float
    delivery_fee: float
    transaction_id: str
    payment_status: str
    event_id: int
    status: bool

    @staticmethod
    def from_dict(obj: Any) -> 'TransactionsHistoryModel':
        assert isinstance(obj, dict)
        sender_uid = from_str(obj.get("sender_uid"))
        receiver_uid = from_str(obj.get("receiver_uid"))
        transaction_amount = from_float(obj.get("transaction_amount"))
        shagun_amount = from_float(obj.get("shagun_amount"))
        greeting_card_id = from_int(obj.get("greeting_card_id"))
        transaction_fee = from_float(obj.get("transaction_fee"))
        delivery_fee = from_float(obj.get("delivery_fee"))
        transaction_id = from_str(obj.get("transaction_id"))
        payment_status = from_str(obj.get("payment_status"))
        event_id = from_int(obj.get("event_id"))
        status = from_bool(obj.get("status"))
        return TransactionsHistoryModel(sender_uid, receiver_uid, transaction_amount, shagun_amount, greeting_card_id, transaction_fee, delivery_fee, transaction_id, payment_status, event_id, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["sender_uid"] = from_str(self.sender_uid)
        result["receiver_uid"] = from_str(self.receiver_uid)
        result["transaction_amount"] = to_float(self.transaction_amount)
        result["shagun_amount"] = to_float(self.shagun_amount)
        result["greeting_card_id"] = from_int(self.greeting_card_id)
        result["transaction_fee"] = to_float(self.transaction_fee)
        result["delivery_fee"] = to_float(self.delivery_fee)
        result["transaction_id"] = from_str(self.transaction_id)
        result["payment_status"] = from_str(self.payment_status)
        result["event_id"] = from_int(self.event_id)
        result["status"] = from_bool(self.status)
        return result


def transactions_history_model_from_dict(s: Any) -> TransactionsHistoryModel:
    return TransactionsHistoryModel.from_dict(s)


def transactions_history_model_to_dict(x: TransactionsHistoryModel) -> Any:
    return to_class(TransactionsHistoryModel, x)
