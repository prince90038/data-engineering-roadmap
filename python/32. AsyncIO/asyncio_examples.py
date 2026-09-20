"""
asyncio_examples.py

Examples for basic async/await usage, creating tasks, and running an
async HTTP call (requires `httpx` or similar to fully test).
"""

import asyncio


async def fetch(n):
    print(f"fetch {n}")
    await asyncio.sleep(0.1)
    return n


async def main():
    result = await asyncio.gather(*(fetch(i) for i in range(5)))
    print(result)


if __name__ == "__main__":
    asyncio.run(main())
