import datetime
from enum import Enum


class TickType:
    value: float
    timeStamp: datetime.datetime


class CandleType:
    liveTime: int
    input: float
    output: float
    min: float
    max: float
    color: str


class TimeRange:
    def __init__(self, beginTime: datetime.datetime = datetime.datetime(2016, 5, 5, 7, 0, 0),
                 endTime: datetime.datetime = datetime.datetime(2016, 5, 5, 7, 30, 0)):
        self.beginTime = beginTime
        self.endTime = endTime


class StatusFlag(Enum):
    outDeal = 0
    inDeal = 1


class Need:
    candleCount: int
    candleLiveTime: int
    dataTimeRange: int


class Decision(Enum):
    SELL = 0
    BUY = 1
    STAY = 2


def buy():
    wallet = - 5

# if __name__ == "__main__":
