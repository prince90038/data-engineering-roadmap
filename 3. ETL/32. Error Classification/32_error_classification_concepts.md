# Error Classification

## 1. Why classify errors?

Not all pipeline failures are the same.

Some are temporary and recoverable. Others are permanent and require a different response.

---

## 2. Transient errors

Transient errors are usually temporary and may resolve after a retry.

Examples:

- network timeout
- temporary service unavailable
- rate limit response

These often should be retried with backoff.

---

## 3. Permanent errors

Permanent errors typically indicate a configuration or data problem that will not fix itself.

Examples:

- invalid schema
- missing required field
- unauthorized access
- invalid business rule

These usually need explicit handling, not blind retries.

---

## 4. Best practices

A pipeline should:

- classify each error
- choose a response strategy
- log details with context
- separate retry logic from permanent failure handling

---

## 5. Key learning goals

By the end of this topic, you should be able to:

- explain transient vs permanent pipeline errors
- identify common examples of each type
- distinguish between retryable and non-retryable behaviors
- design a safer operational response for each category

---

## 6. Practice prompts

Try solving:

- classify a database timeout as transient or permanent
- explain why a 400 Bad Request should not be retried blindly
- outline a response plan for a repeated schema mismatch

Good error classification helps pipelines act correctly under pressure.
