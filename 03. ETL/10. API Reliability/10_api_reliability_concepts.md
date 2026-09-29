# API Reliability

## 1. Why API reliability matters

APIs are often the weakest dependency in a pipeline because they are external and may be rate-limited, flaky, or unavailable.

A resilient pipeline must handle these cases safely.

---

## 2. Typical reliability flow

```text
Request
  ↓
Timeout?
  ↓
Retry?
  ↓
Rate limit?
  ↓
Backoff
  ↓
Success or failure
```

This decision flow helps distinguish transient problems from permanent ones.

---

## 3. Timeout handling

A pipeline should set suitable timeouts for:

- connection timeout
- read timeout
- request duration

A request that hangs forever is a pipeline reliability problem.

---

## 4. Retry policies

Not every failure should be retried.

Examples of retryable errors:

- temporary network failure
- 429 rate limit
- 500 server error

Examples of non-retryable errors:

- 400 bad request
- 401 unauthorized
- 403 forbidden

---

## 5. Exponential backoff

Exponential backoff adds waiting time between retries.

Example:

```text
1s, 2s, 4s, 8s, 16s
```

This reduces pressure on the API and improves successful retry behavior.

---

## 6. Circuit breaker concept

A circuit breaker stops repeated calls to a failing dependency after a threshold is reached.

This prevents a pipeline from constantly hammering a service that is already failing.

---

## 7. Logging and observability

A reliable pipeline records:

- request status
- retry count
- response code
- failure reason
- timestamps

This is necessary for debugging and operational support.

---

## 8. Key learning goals

By the end of this topic, you should be able to:

- explain retryable vs non-retryable API errors
- outline exponential backoff usage
- identify timeout and rate-limit handling patterns
- reason about availability and resilience in external integrations

---

## 9. Practice prompts

Try solving:

- design a retry policy for a rate-limited API
- explain when a circuit breaker is useful
- describe how to safely log failed API calls without leaking secrets

API reliability is a critical bridge between business systems and reliable analytics pipelines.
