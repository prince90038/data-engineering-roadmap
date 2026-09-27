# Micro-Batching

## 1. What is micro-batching?

Micro-batching is a middle ground between batch and streaming.

Instead of processing a full dataset at once, the system processes small collections of records, often every few seconds or minutes.

---

## 2. Typical micro-batch flow

```text
Small batch
  ↓
Process
  ↓
Small batch
  ↓
Process
```

This reduces latency while keeping many of the simplicity advantages of batch job design.

---

## 3. Use cases

Micro-batching is useful for:

- near-real-time analytics
- event-driven ingestion systems
- loosely coupled extraction pipelines
- systems that do not require full streaming architecture

---

## 4. Benefits

Benefits include:

- lower complexity than true streaming
- easier debugging than continuous processing
- reduced latency compared with daily or hourly batches

---

## 5. Trade-offs

Micro-batching still has limits:

- data is not immediately continuous
- timing is still shaped by batch windows
- state management can become complex at scale

---

## 6. Key learning goals

By the end of this topic, you should be able to:

- define micro-batching
- explain how it differs from true streaming
- identify use cases where micro-batching is appropriate
- describe when a fuller streaming design is necessary

---

## 7. Practice prompts

Try solving:

- explain why micro-batching is useful for customer activity processing
- compare a 5-minute micro-batch with a true streaming pipeline
- outline a micro-batch design for a dashboard refresh system

Micro-batching is a practical approach when low latency matters but full streaming complexity is not required.
