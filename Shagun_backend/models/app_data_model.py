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
class AppDataModel:
    platform: str
    app_name: str

    @staticmethod
    def from_dict(obj: Any) -> 'AppDataModel':
        assert isinstance(obj, dict)
        platform = from_str(obj.get("platform"))
        app_name = from_str(obj.get("app_name"))
        return AppDataModel(platform, app_name)

    def to_dict(self) -> dict:
        result: dict = {}
        result["platform"] = from_str(self.platform)
        result["app_name"] = from_str(self.app_name)
        return result


def app_data_model_from_dict(s: Any) -> AppDataModel:
    return AppDataModel.from_dict(s)


def app_data_model_to_dict(x: AppDataModel) -> Any:
    return to_class(AppDataModel, x)
