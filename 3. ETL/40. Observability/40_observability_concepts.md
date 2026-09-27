# Observability

## 1. What is observability?

Observability is the ability to understand the internal state of a system from the signals it emits.

For data pipelines, those signals include logs, metrics, and traces.

---

## 2. Core observability signals

The three primary signals are:

- logs
- metrics
- traces

For data pipelines, you also care about:

- data freshness
- data volume
- data quality
- pipeline duration
- failure rate

---

## 3. Why observability matters

A pipeline can appear to run successfully while still being broken in important ways.

Observability helps teams answer:

- is the pipeline running?
- is it producing the right volume?
- is the data fresh?
- is the data valid?
- where did it fail?

---

## 4. Metrics worth tracking

Examples:

- records read
- records written
- records rejected
- processing time
- throughput
- failure count
- retry count
- data freshness lag
- cost

---

## 5. Key learning goals

By the end of this topic, you should be able to:

- explain observability in a data pipeline context
- identify the main kinds of signals used for monitoring
- list production metrics that matter for ETL/ELT systems
- reason about how observability influences incident response

---

## 6. Practice prompts

Try solving:

- design an observability plan for a daily ETL job
- explain why freshness and quality metrics matter as much as runtime
- list what metrics would help detect a silent data loss problem

Observability turns a pipeline from a black box into a system you can reason about and operate safely.
