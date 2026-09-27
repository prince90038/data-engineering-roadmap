# Sharding in SQL

## 1. What is sharding?

Sharding is the practice of distributing data across multiple database instances or nodes.

This is usually done to scale horizontally, which means expanding capacity by adding more machines rather than making one machine much larger.

---

## 2. Why shard data?

Sharding is used when a single database cannot comfortably handle:

- very large data volumes
- high write throughput
- large concurrent query loads

It helps spread the workload across multiple nodes.

---

## 3. Shard key

A shard key is the column or set of columns used to decide which node stores a given row.

A good shard key should distribute data evenly and minimize hotspots.

---

## 4. Hot partitions

A hot partition occurs when one shard receives much more data or traffic than the others.

This can create performance bottlenecks and balance problems.

---

## 5. Trade-offs of sharding

Sharding improves scalability, but it brings complexity:

- cross-shard joins become harder
- rebalancing data can be difficult
- backup and restore logic is more complex
- application logic must understand data placement

---

## 6. Horizontal sharding

Horizontal sharding means splitting rows across nodes rather than splitting columns.

This is the most common pattern in distributed databases.

---

## 7. When sharding is useful

Sharding becomes relevant when:

- a single node is too slow
- data volume is growing rapidly
- the system is becoming write-heavy
- a relational database is no longer sufficient alone

---

## 8. Key learning goals

By the end of this topic, you should be able to:

- explain what sharding is
- describe a shard key
- identify why hot partitions are a problem
- explain the trade-offs of horizontal sharding

---

## 9. Practice prompts

Try solving:

- explain why sharding is different from partitioning
- choose a shard key for a large customer table
- discuss why uneven distribution can hurt performance
- explain when sharding may be necessary in a real data platform

Sharding is an advanced distributed database concept that becomes relevant as systems scale beyond a single node.
