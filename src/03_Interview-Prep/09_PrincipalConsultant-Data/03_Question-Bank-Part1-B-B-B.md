---
content_type: "interview_prep"
learning_level: "Advanced"
prerequisites: ["./03_Question-Bank-Part1-B-B-A.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Master PySpark UDF optimization"
  - "Learn efficient join strategies"
  - "Understand join types and performance"
related_topics:
  prerequisites: ["./03_Question-Bank-Part1-B-B-A.md"]
  builds_upon: []
  enables: ["./03_Question-Bank-Part1-C-A.md"]
  cross_refs: ["../06_Solution-Architect/03_Principal-Consultant-Question-Bank-Part1-B.md"]
---

# Principal Consultant - Data Question Bank (Medium Level) - Part 2-B

**PySpark optimization questions** covering UDFs and join strategies.

---

## PySpark

### 7. Explain UDF vs Pandas UDF vs SQL functions.

**Answer:**

**SQL Functions (Built-in):**
- Native Spark functions (e.g., `concat`, `substring`, `date_format`)
- Optimized by Catalyst optimizer
- Best performance
- Use whenever possible

**UDF (User-Defined Functions):**
- Custom Python functions
- Row-by-row processing
- Slower performance (Python overhead)
- Use only when SQL functions insufficient

**Pandas UDF (Vectorized UDF):**
- Processes data in batches using Pandas
- Better performance than regular UDFs
- Still slower than SQL functions
- Use for complex transformations not available in SQL

**Performance Order:**
1. SQL functions (fastest)
2. Pandas UDF (moderate)
3. Regular UDF (slowest)

**Best Practice:** Always prefer SQL functions, use UDFs only when necessary.

---

### 8. How do you join two large datasets efficiently?

**Answer:**

**Join Strategy Selection:**

**Broadcast Join:**
- Use when one dataset is small (< 2GB)
- Avoids shuffle operation
- Best performance for small lookup tables

**Sort-Merge Join:**
- Default for large datasets
- Requires data sorted on join keys
- Efficient for equi-joins

**Bucketed Join:**
- Pre-bucket data on join keys
- Avoids shuffle during join
- Requires pre-processing

**Optimization Techniques:**
- Ensure join keys are properly partitioned
- Filter data before joining when possible
- Use appropriate join types (inner vs outer)
- Monitor and handle data skew

---

## 🎯 Answering Strategy for Medium Questions

1. **Show Practical Experience**: Reference real-world scenarios
2. **Explain Trade-offs**: Discuss pros and cons of approaches
3. **Provide Examples**: Concrete implementation details
4. **Demonstrate Depth**: Show understanding beyond surface level

---

**Next**: [Question Bank - Advanced Level](./03_Question-Bank-Part1-C-A.md)
