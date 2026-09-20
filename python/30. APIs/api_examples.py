"""
api_examples.py

Examples for making HTTP requests with `requests` and `httpx` (sync
and async). These examples show patterns for retries, timeouts, and
basic error handling.
"""

try:
    import requests
except Exception:
    requests = None

try:
    import httpx
except Exception:
    httpx = None


def requests_example(url: str):
    if requests is None:
        print("requests not installed")
        return
    resp = requests.get(url, timeout=5)
    resp.raise_for_status()
    return resp.json()


async def httpx_example(url: str):
    if httpx is None:
        print("httpx not installed")
        return
    async with httpx.AsyncClient(timeout=5) as client:
        resp = await client.get(url)
        resp.raise_for_status()
        return resp.json()


def requests_get(url: str, timeout: float = 5.0):
    """Simple GET with timeout and error handling using `requests`.

    Returns parsed JSON on success or raises for HTTP errors.
    """
    if requests is None:
        raise RuntimeError("requests not installed")
    resp = requests.get(url, timeout=timeout)
    resp.raise_for_status()
    return resp.json()


def requests_post(url: str, payload: dict, timeout: float = 5.0):
    """POST JSON payload and return parsed response."""
    if requests is None:
        raise RuntimeError("requests not installed")
    resp = requests.post(url, json=payload, timeout=timeout)
    resp.raise_for_status()
    return resp.json()


def requests_with_session(urls: list[str]):
    """Use a `requests.Session` to reuse connections for multiple requests."""
    if requests is None:
        raise RuntimeError("requests not installed")
    with requests.Session() as s:
        for u in urls:
            resp = s.get(u, timeout=5)
            resp.raise_for_status()
            yield resp.json()


def requests_retry(url: str, retries: int = 3, backoff: float = 1.0):
    """Simple retry loop with exponential backoff on network errors."""
    if requests is None:
        raise RuntimeError("requests not installed")
    import time
    last_exc = None
    for attempt in range(1, retries + 1):
        try:
            return requests_get(url)
        except Exception as exc:
            last_exc = exc
            if attempt == retries:
                raise
            time.sleep(backoff * (2 ** (attempt - 1)))


def paginate_api(url: str, params: dict | None = None):
    """Generator that follows simple `page`/`per_page` styled pagination.

    Adjust the logic to match an API's pagination scheme.
    """
    if requests is None:
        raise RuntimeError("requests not installed")
    params = dict(params or {})
    page = 1
    while True:
        params.update({"page": page})
        resp = requests.get(url, params=params, timeout=5)
        resp.raise_for_status()
        data = resp.json()
        items = data.get("items") or data
        if not items:
            break
        for it in items:
            yield it
        page += 1


def stream_download(url: str, dest_path: str, chunk_size: int = 8192):
    """Download large responses in streaming mode to avoid loading into memory."""
    if requests is None:
        raise RuntimeError("requests not installed")
    with requests.get(url, stream=True, timeout=10) as r:
        r.raise_for_status()
        with open(dest_path, "wb") as f:
            for chunk in r.iter_content(chunk_size=chunk_size):
                if chunk:
                    f.write(chunk)


def auth_examples():
    """Examples for header/bearer and basic auth usage."""
    if requests is None:
        raise RuntimeError("requests not installed")
    # Bearer token
    def bearer(url: str, token: str):
        h = {"Authorization": f"Bearer {token}"}
        resp = requests.get(url, headers=h, timeout=5)
        resp.raise_for_status()
        return resp.json()

    # Basic auth
    def basic(url: str, username: str, password: str):
        resp = requests.get(url, auth=(username, password), timeout=5)
        resp.raise_for_status()
        return resp.json()

    return {"bearer": bearer, "basic": basic}


async def httpx_get(url: str, timeout: float = 5.0):
    """Async GET using `httpx`.

    Returns parsed JSON on success.
    """
    if httpx is None:
        raise RuntimeError("httpx not installed")
    async with httpx.AsyncClient(timeout=timeout) as client:
        resp = await client.get(url)
        resp.raise_for_status()
        return resp.json()


async def httpx_post(url: str, payload: dict, timeout: float = 5.0):
    if httpx is None:
        raise RuntimeError("httpx not installed")
    async with httpx.AsyncClient(timeout=timeout) as client:
        resp = await client.post(url, json=payload)
        resp.raise_for_status()
        return resp.json()


async def httpx_retry(url: str, retries: int = 3, backoff: float = 1.0):
    if httpx is None:
        raise RuntimeError("httpx not installed")
    import asyncio
    last_exc = None
    for attempt in range(1, retries + 1):
        try:
            return await httpx_get(url)
        except Exception as exc:
            last_exc = exc
            if attempt == retries:
                raise
            await asyncio.sleep(backoff * (2 ** (attempt - 1)))


async def httpx_stream_download(url: str, dest_path: str, chunk_size: int = 8192):
    if httpx is None:
        raise RuntimeError("httpx not installed")
    async with httpx.AsyncClient(timeout=10.0) as client:
        async with client.stream("GET", url) as r:
            r.raise_for_status()
            with open(dest_path, "wb") as f:
                async for chunk in r.aiter_bytes(chunk_size):
                    f.write(chunk)


if __name__ == "__main__":
    print("Run examples in your environment where requests/httpx are installed")
    print("Available helpers: requests_get, requests_post, requests_with_session, requests_retry, paginate_api, stream_download, auth_examples, httpx_get, httpx_post, httpx_retry, httpx_stream_download")

if __name__ == "__main__":
    print("Run examples in your environment where requests/httpx are installed")
