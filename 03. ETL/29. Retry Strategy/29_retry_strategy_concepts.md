# Retry Strategy

## 1. What is a retry strategy?

A retry strategy decides when and how a pipeline should attempt a failed action again.

This is important because transient errors are common in distributed systems.

---

## 2. Retryable vs non-retryable errors

Retryable errors may include:

- network timeout
- service unavailable
- rate limit response
- temporary outage

Non-retryable errors may include:

- invalid input
- malformed schema
- expired credentials
- non-existent resource

---

## 3. Exponential backoff

Exponential backoff adds waiting time between retries.

Example:

```text
1s, 2s, 4s, 8s...
```

This prevents retry storms and reduces pressure on external systems.

---

## 4. Jitter

Jitter adds randomness to retry timing to avoid many jobs retrying simultaneously.

This is useful in large production environments handling bursts of failures.

---

## 5. Best practices

Strong retry policies often include:

- limit on number of retries
- circuit breaker patterns
- different policies for retryable and non-retryable errors
- dead-letter handling for bad records

---

## 6. Key learning goals

By the end of this topic, you should be able to:

- explain retryable vs non-retryable errors
- describe exponential backoff and jitter
- design a sane retry policy for a data pipeline
- reason about avoiding retry storms

---

## 7. Practice prompts

Try solving:

- define a retry policy for a 429 API response
- explain why a pipeline should not retry invalid schema forever
- design a retry strategy for database connection drops

A good retry strategy balances resilience with operational safety.
