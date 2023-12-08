import itertools
import json
import re



# PATTERN = re.compile(r"\((?:[^,()]*,)*([^,()]+)\)")
# PATTERN = re.compile(r"(\w+)\((\d+)(?:,(\d+))?(?:,(\d+))?((?:,(\d+))?(?:,(\d+))?(?:,(\d+))?)?\)")
# PATTERN = re.compile(r"(\w+)\((?:[^,()]*,)*([^,()]+)\)")
PATTERN = re.compile(r"(\w+)\(.*\,(\d+)\)")

# is_optimizing = input("is this an optimizing program? (y/n): ")
output_filename = input("clingo output filename: ").strip()
if not output_filename:
    output_filename = "output.json"

def group_by(iterable, key):
    sorted_iterable = sorted(iterable, key=key)
    return itertools.groupby(sorted_iterable, key=key)

def parse(value):
    # print(PATTERN.match(value).groups())
    # predicate, time = PATTERN.search(value).groups()
    predicate, time = PATTERN.match(value).groups()
    return int(time), predicate, value

with open(output_filename) as f:
    data = json.load(f)

outputs = data.get("Call")[0].get("Witnesses")
optimal = sorted(outputs, key=lambda d: d.get("Costs")[0])
models = optimal[0].get("Value")
parsed = [parse(m) for m in models]

time_grouped = {t: list(g) for t, g in group_by(parsed, key=lambda k: k[0])}
for t, group in time_grouped.items():
    predicate_grouped = {
        p: list(g) for p, g in group_by(list(group), key=lambda k: k[1])
    }
    for p, g in predicate_grouped.items():
        predicate_grouped[p] = [v[-1] for v in g]
    time_grouped[t] = predicate_grouped

with open(output_filename, "w") as file:
    json.dump(time_grouped, file, indent=1)
