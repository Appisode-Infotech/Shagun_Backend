from dataclasses import dataclass
from typing import Any, TypeVar, Type, cast


T = TypeVar("T")


def from_int(x: Any) -> int:
    assert isinstance(x, int) and not isinstance(x, bool)
    return x


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def from_float(x: Any) -> float:
    assert isinstance(x, (float, int)) and not isinstance(x, bool)
    return float(x)


def to_float(x: Any) -> float:
    assert isinstance(x, float)
    return x


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


@dataclass
class GreetingCardsModel:
    id: int
    card_name: str
    card_image_url: str
    card_price: float
    status: int

    @staticmethod
    def from_dict(obj: Any) -> 'GreetingCardsModel':
        assert isinstance(obj, dict)
        id = from_int(obj.get("id"))
        card_name = from_str(obj.get("card_name"))
        card_image_url = from_str(obj.get("card_image_url"))
        card_price = from_float(obj.get("card_price"))
        status = from_int(obj.get("status"))
        return GreetingCardsModel(id, card_name, card_image_url, card_price, status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["id"] = from_int(self.id)
        result["card_name"] = from_str(self.card_name)
        result["card_image_url"] = from_str(self.card_image_url)
        result["card_price"] = to_float(self.card_price)
        result["status"] = from_int(self.status)
        return result


def greeting_cards_model_from_dict(s: Any) -> GreetingCardsModel:
    return GreetingCardsModel.from_dict(s)


def greeting_cards_model_to_dict(x: GreetingCardsModel) -> Any:
    return to_class(GreetingCardsModel, x)
