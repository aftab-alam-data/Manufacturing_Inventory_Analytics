# Manufacturing Inventory Analytics - Project Documentation

## Objective

The objective of this project is to analyze manufacturing inventory operations using Excel, SQL, and Power BI. The project focuses on purchases, production, raw materials, suppliers, BOM usage, and inventory transactions.

## Business Questions

This project answers questions such as:

- What is the total purchase quantity and purchase value?
- Which suppliers and materials contribute most to purchase activity?
- What is the delivery status distribution?
- How much production was planned, produced, and rejected?
- What is the production efficiency?
- How are inventory transactions distributed across opening stock, purchase receipts, and production issues?

## Data Model

The project uses the following main data areas:

| Dataset | Description |
|---|---|
| Products | Finished goods and product attributes |
| Raw Materials | Materials used in manufacturing |
| Suppliers | Supplier master data |
| BOM | Product-to-material requirements |
| Purchases | Purchase transaction records |
| Production | Production transaction records |
| Inventory | Inventory movement transactions |

## Verified Data Counts

| Dataset | Count |
|---|---:|
| Products | 12 |
| Raw Materials | 25 |
| Suppliers | 28 |
| BOM Records | 133 |
| Purchase Transactions | 700 |
| Production Transactions | 500 |
| Inventory Transactions | 6,229 |

## Verified KPI Summary

| KPI | Verified Value |
|---|---:|
| Total Purchase Quantity | 196,193 |
| Total Purchase Value | 67,241,528.37 |
| Average Purchase Value per Unit | 342.73 |
| Delivered Transactions | 579 |
| Delayed Transactions | 86 |
| Partial Transactions | 35 |
| Planned Production Quantity | 145,921 |
| Produced Quantity | 138,937 |
| Rejected Quantity | 2,800 |
| Production Efficiency | 95.21% |
| Rejection Rate | 2.02% |

## Purchase Value Logic

Final purchase value uses this corrected logic:

```sql
purchase_quantity * unit_cost
    * (1 - discount_percent / 100)
    * (1 + gst_percent / 100)
```

This logic was aligned across Excel, SQL, and Power BI.

## Excel Work

Excel was used for:

- Structured data tables
- Purchase analysis
- Production analysis
- Pivot tables
- KPI summaries
- Charts
- Formula-based purchase value validation

## SQL Work

SQL was used for:

- Database setup
- Data validation
- Aggregation queries
- Supplier analysis
- Material analysis
- Purchase value analysis
- Production analysis
- Inventory transaction analysis
- BOM analysis

The final SQL script was cleaned before documentation. Duplicate inventory insert data and an invalid inventory column reference were removed.

## Power BI Work

Power BI was used to create a dashboard with three pages:

1. Purchase Quantity Analysis
2. Purchase Value Analysis
3. Production Quantity Analysis

The dashboard includes KPI cards, line charts, bar charts, column charts, a donut chart, table visual, and slicer.

## Final Status

| Component | Status |
|---|---|
| Excel Workbook | Verified |
| SQL Scripts | Corrected and verified |
| Power BI Report | Corrected and verified |
| Documentation | Created |

