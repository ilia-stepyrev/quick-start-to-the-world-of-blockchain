# Примеры кода с митапа "Быстрый старт в мир Блокчейна"

Митап состоял из двух докладов, ссылки на которые можно найти тут:

- [Основы Блокчейна](https://www.youtube.com/watch?v=pTBfe4dN9I8)
- [Пишем серверную часть, используя Блокчейн](https://www.youtube.com/watch?v=QQO9r0R5VVo)

Ниже вы можете найти примеры кода, показанные во втором докладе.

## Резервирование денег для продавца

```javascript
ContractWithVasya
  .deployed()
  .then((instance) =>
     instance.reserveMoneyFor(
        "0xCf01785562Aa7849d11143aD7B2BF05d45F14F65",
        3,
        1,
        {value: 2000000000000000000}
     ))
```

## Отмена резервирования

```javascript
ContractWithVasya
  .deployed()
  .then((instance) =>
     instance.cancelReservation(
        "0xCf01785562Aa7849d11143aD7B2BF05d45F14F65",
        1
     ))
```

## Подтверждение получения товара

```javascript
ContractWithVasya
  .deployed()
  .then((instance) =>
     instance.confirmReception(
        "0xCf01785562Aa7849d11143aD7B2BF05d45F14F65",
        1
     ))
```

## Чтение деталей сделки

```javascript
ContractWithVasya
  .deployed()
  .then((instance) =>
     instance.contractDetails.call(
        "0xfbC384552304cbDf1b70FAaA52D9D6D4b20E72f9",
        "0xCf01785562Aa7849d11143aD7B2BF05d45F14F65",
        1
     ))
```
