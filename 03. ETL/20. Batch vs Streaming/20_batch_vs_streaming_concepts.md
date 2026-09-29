# Batch vs Streaming

## 1. Why compare them?

Both batch and streaming are used to move and process data, but they have different latency, operational, and complexity trade-offs.

---

## 2. Batch processing

Batch systems process records in scheduled windows.

Advantages:

- simpler design
- easier to recover from failures
- easier to debug
- predictable cost

Disadvantages:

- higher latency
- less responsive to real-time changes

---

## 3. Streaming processing

Streaming systems process events continuously as they arrive.

Advantages:

- low latency
- near-real-time updates
- good for event-driven systems

Disadvantages:

- more complex architecture
- checkpointing and state management required
- harder debugging and recovery

---

## 4. Decision factors

Choose batch when:

- a delay of minutes or hours is acceptable
- process cost must be predictable
- a scheduled pipeline is enough

Choose streaming when:

- low-latency decisions are required
- events must be processed in near real time
- continuous processing is a business need

---

## 5. Key learning goals

By the end of this topic, you should be able to:

- compare batch and streaming processing
- explain latency and complexity trade-offs
- identify when each approach is appropriate
- reason about architecture choices in enterprise data systems

---

## 6. Practice prompts

Try solving:

- compare daily batch processing with real-time fraud detection
- explain why a billing pipeline usually uses batch processing
- outline when streaming is justified for user activity pipelines

Batch and streaming are not rivals; they are complementary patterns used for different business needs.
