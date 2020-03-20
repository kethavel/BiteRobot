from datetime import datetime, timedelta
from enum import Enum


class TickType:
    pair: int  # код пары, к которой относится тик. необходимо для мапинга объектов с бд
    timestamp: datetime
    tradeDirection: int
    price: float
    volume: float


class CandleType:
    quantity: timedelta  # при таком определении можно будет проводить алгебр. операции
    beginTimestamp: datetime
    volume: float
    open: float
    high: float
    low: float
    close: float


class TimeRange:
    def __init__(self, beginTime: datetime,  # = datetime.datetime(2016, 5, 5, 7, 0, 0),
                 endTime: datetime):  # = datetime.datetime(2016, 5, 5, 7, 30, 0)):
        self.beginTime = beginTime
        self.endTime = endTime


class StatusFlag(Enum):
    outDeal = 0
    inDeal = 1


class Need:
    """Класс, содержащий информацию о том, какие дополнительные данные нужны стратегии для работы

    Args:
        candleCount - сколько свеч нужно
        quantity - какого размера
        timedelta - какой временной интервал

       """
    TICKS_WITH_AMOUNT: int = 0
    TICKS_WITH_TIMEDELTA: int = 1
    CANDLES: int = 2

    def __init__(self, worksWith: str = None, preparedAmount: int = None, quantity: timedelta = None,
                 timedeltaBeforeStart: timedelta = None):
        worksWith = worksWith.lower()
        if worksWith == "candles":
            raise NotImplementedError()
        # self.prepareType = Need.CANDLES
        elif worksWith == "ticks":
            if preparedAmount is not None:
                raise NotImplementedError()
            # self.prepareType = Need.TICKS_WITH_AMOUNT
            elif timedeltaBeforeStart is not None:
                self.prepareType = Need.TICKS_WITH_TIMEDELTA
                self.timedeltaBeforeStart = timedeltaBeforeStart
            else:
                raise ValueError("You should provide number of ticks or timedelta also")
        else:
            raise ValueError("You should say if strategy works with candles or ticks. Set parameter worksWith")

    def getNeededData(self):
        if self.prepareType == Need.TICKS_WITH_TIMEDELTA:
            return Need.TICKS_WITH_TIMEDELTA, self.timedeltaBeforeStart
        else:
            NotImplementedError()


class Decision(Enum):
    SELL = 0
    BUY = 1
    STAY = 2


def buy():
    wallet = - 5


if __name__ == "__main__":
    need = Need(worksWith="ticks", timedeltaBeforeStart=timedelta(days=1)).getNeededData()
    print(need[0] == Need.TICKS_WITH_TIMEDELTA)
