## Less iteration, better charts: rethinking how we create visualizations

Creating a chart is usually an iterative process. We build a rough first version, then tweak the colors, change the chart type, adjust the title, and refine the styling until we are satisfied. Thanks to AI coding tools, this cycle has become even faster.

But what if we approached it differently? What if coding were the final step instead of the first? This talk explores a design first, code second process that starts with the "why" before moving to the "how."

We will discuss why, if you want to create great charts, you should stop starting with code and instead clarify your goal upfront. This approach not only leads to better visual outcomes but also changes how we write code and how we use AI coding tools. When the intent is clearly defined, prompts become more precise, the generated code is closer to the desired result, and the number of revisions drops significantly. By defining intent before implementation, you become stronger in both visual storytelling and software development while shortening the iteration cycle.

> Joseph Barbier is a data consultant and the founder of Yellow Sunflower. His work focuses on making data workflows simpler, more reproducible, and visually clear, from analysis to reporting. He also develops and maintains several open source data visualization packages.

<br>
<br>
<br>

# **Less iteration, better charts: rethinking how we create visualizations**

## 0. Opening (2–3 min)

**Hook**

- "Most charts are not bad because of poor coding… they're bad because no one asked _why they exist_."
- Quick show of hands: "Who here starts a chart by opening a notebook / tool?"

**Context**

- Iteration has always been part of chart-making
- AI has accelerated this loop dramatically
- But faster iteration ≠ better outcomes

**Thesis**

- We should invert the process:
  → **design first, code last**
- This reduces iteration _and_ improves clarity, storytelling, and code quality

## 1. The default workflow (5 min)

### 1.1 What we usually do

- Take dataset
- Start exploring
- Build a first chart
- Iterate endlessly:
  - change chart type
  - tweak colors
  - rewrite labels
  - adjust scales
  - repeat

### 1.2 Why this feels natural

- Tools encourage it (notebooks, BI tools, libraries)
- Immediate feedback loop
- Feels productive

### 1.3 The hidden problems

- No clear goal → charts without purpose
- Local optimizations instead of global clarity
- Endless micro-decisions
- Hard to know when you're "done"

**Transition**

- "We iterate because we skipped something important."

## 2. The missing step: defining intent (6–7 min)

### 2.1 The key question

- "Why does this chart need to exist?"

### 2.2 What "intent" actually means

Break it into 3 concrete elements:

- **Audience** → who is this for?
- **Message** → what should they understand?
- **Decision / action** → what changes after seeing it?

### 2.3 Examples

- Weak intent: "Show sales over time"
- Strong intent: "Show that sales dropped after pricing change to justify reverting it"

### 2.4 What happens without intent

- Charts become descriptive, not explanatory
- Viewer does the interpretation work
- You rely on iteration to "discover" meaning

**Transition**

- "Once intent is clear, most design decisions stop being guesses."

## 3. Design before code (8–10 min)

### 3.1 Shift in mindset

- From: "What chart can I make?"
- To: "What should the viewer see and understand?"

### 3.2 Designing the chart (before touching code)

Walk through a concrete example step-by-step:

#### Step 1: Define the message

- "Sales dropped after price increase"

#### Step 2: Choose the structure

- Time series? Comparison? Before/after?

#### Step 3: Decide emphasis

- Highlight the drop
- Annotate the pricing change
- Reduce noise

#### Step 4: Sketch (mentally or on paper)

- Axis choices
- Key annotations
- What stands out vs fades

### 3.3 What this changes

- Chart type becomes obvious
- Fewer arbitrary choices
- Less reliance on trial-and-error

**Optional demo idea**

- Show:
  - Iterative chart evolution (messy)
  - Final design-first chart (clear, intentional)

**Transition**

- "At this point, coding becomes almost mechanical."

## 4. Code as the final step (5–6 min)

### 4.1 Reframing coding

- Not exploration
- Not decision-making
- Just implementation

### 4.2 Impact on code quality

- More structured
- Fewer rewrites
- Clear mapping from intent → code

### 4.3 Impact on AI usage

- Weak prompt:
  - "Make a nice chart of this dataset"

- Strong prompt:
  - "Create a line chart showing X, highlight Y, annotate Z, minimize gridlines…"

### 4.4 Result

- Fewer iterations
- Outputs closer to final result
- Less frustration

**Transition**

- "So what difference does this actually make in practice?"

## 5. What difference does it make? (5–6 min)

### 5.1 Better charts

- More focused
- Easier to understand
- Stronger storytelling

### 5.2 Less iteration

- Fewer back-and-forth changes
- Less time spent tweaking details

### 5.3 Better thinking

- You clarify your reasoning before building
- You become more intentional

### 5.4 Better developers

- Clearer specs → better code
- Less dependency on tooling "guessing"

### 5.5 Key insight

- Iteration is often a symptom of unclear thinking, not a requirement

## 6. Practical framework (takeaway) (4–5 min)

Give a simple repeatable process:

### The 4-step approach

1. **Define intent**
   - Who? What? Why?

2. **Write the message in one sentence**
   - If you can't, you're not ready

3. **Design the chart**
   - Structure, emphasis, annotations

4. **Then code**
   - Implement, don't explore

### Optional rule

- "No code until you can describe the chart precisely in words"

## 7. Closing (2–3 min)

**Recap**

- Most people start with code → leads to iteration
- Start with intent → leads to clarity
- Design → then code

**Final thought**

- "The goal isn't to iterate faster. It's to need fewer iterations."

**Optional closing line**

- "If your chart requires a lot of iteration, it's probably because you didn't decide what it should say."
