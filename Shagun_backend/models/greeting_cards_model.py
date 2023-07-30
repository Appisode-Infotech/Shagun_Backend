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
class GreetingCardsModel:
    card_name: str
    card_price: str
    card_image_url: Optional[str] = None
    status: Optional[str] = None
    id: Optional[str] = None
    printer_id: Optional[str] = None


    @staticmethod
    def from_dict(obj: Any) -> 'GreetingCardsModel':
        assert isinstance(obj, dict)
        id = from_union([from_str, from_none], obj.get("id"))
        card_name = from_str(obj.get("card_name"))
        card_price = from_str(obj.get("card_price"))
        card_image_url = from_union([from_str, from_none], obj.get("card_image_url"))
        status = from_union([from_str, from_none], obj.get("status"))
        printer_id = from_union([from_str, from_none], obj.get("printer_id"))
        return GreetingCardsModel(card_name, card_price, card_image_url, status, id, printer_id)

    def to_dict(self) -> dict:
        result: dict = {}
        if self.id is not None:
            result["id"] = from_union([from_str, from_none], self.id)
            result["card_name"] = from_str(self.card_name)
        result["card_price"] = from_str(self.card_price)
        if self.card_image_url is not None:
            result["card_image_url"] = from_union([from_str, from_none], self.card_image_url)
        if self.status is not None:
            result["status"] = from_union([from_str, from_none], self.status)
        if self.printer_id is not None:
            result["printer_id"] = from_union([from_str, from_none], self.printer_id)
        return result


def greeting_cards_model_from_dict(s: Any) -> GreetingCardsModel:
    return GreetingCardsModel.from_dict(s)


def greeting_cards_model_to_dict(x: GreetingCardsModel) -> Any:
    return to_class(GreetingCardsModel, x)
