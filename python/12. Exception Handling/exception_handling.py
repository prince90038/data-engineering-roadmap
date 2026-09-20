"""
exception_handling.py

Examples for exception handling patterns: try/except/else/finally,
custom exceptions, and best practices for handling errors in data
processing pipelines.
"""

class DataValidationError(Exception):
    """Raised when a data record fails validation."""


def process_record(record):
    """Process a single record, raising DataValidationError on bad data."""
    if not isinstance(record, dict):
        raise DataValidationError("Record must be a dict")
    if "id" not in record:
        raise DataValidationError("Missing id")
    # process record...
    return True


def process_batch(records):
    """Process a batch of records with structured error handling."""
    results = []
    for r in records:
        try:
            result = process_record(r)
        except DataValidationError as e:
            # Log and continue with next record
            print(f"Validation error: {e}")
            continue
        except Exception as e:
            # Unknown error: re-raise after cleanup
            print(f"Unexpected error: {e}")
            raise
        else:
            results.append(result)
        finally:
            # Per-record cleanup if needed
            pass
    return results


if __name__ == "__main__":
    sample = [{"id": 1}, "bad", {"name": "no id"}]
    print(process_batch(sample))
