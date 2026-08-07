---
title: "Prompts for planning your assistant"
description: "Copy practical prompts that help you plan, limit, test and improve a small-business assistant."
weight: 40
show_children: false
---

A prompt is the written instruction that tells an AI what you want it to help
you create. Replace every `<PLACEHOLDER>`, copy the complete prompt and review
the result before using it.

Use made-up customer examples. Do not paste private conversations, personal
information, passwords or access keys into an AI chat.

## Discover what my business assistant should do

**What it helps with:** Choose a small, useful first job.

**Prepare:** Your repeated customer questions and the name of the person who
takes over.

**Expect:** A short assistant brief with clear limits.

```text
Help me plan a focused assistant for <BUSINESS_NAME>, a <BUSINESS_TYPE> in
<TOWN_OR_AREA>.

Customers repeatedly ask us about:
- <QUESTION_1>
- <QUESTION_2>
- <QUESTION_3>

Create a practical brief with:
1. one sentence describing the assistant's purpose;
2. questions it should answer;
3. requests it should send to <HUMAN_ROLE>;
4. the minimum business information it needs;
5. information still marked UNKNOWN;
6. five made-up test conversations.

Keep its role narrow. Do not request unnecessary personal information. Include
a human handover for uncertain or sensitive requests. Mark every assumption and
remind me to verify all facts and review the result before using it.
```

## Organise my approved business information

**What it helps with:** Turn confirmed facts into a clear source for answers.

**Prepare:** Reviewed services, prices, times, locations and policies.

**Expect:** Structured business information with gaps clearly marked.

```text
Organise the approved information below for a customer assistant.

Business: <BUSINESS_NAME>
Services: <APPROVED_SERVICES>
Prices: <APPROVED_PRICES>
Opening or class times: <APPROVED_TIMES>
Confirmed locations: <APPROVED_LOCATIONS>
Policies: <APPROVED_POLICIES>
Contact and handover route: <HUMAN_HANDOVER_ROUTE>

Return these sections: Services, Prices, Times, Locations, Policies, Questions
the information cannot answer, and Facts requiring review. Do not fill gaps
from general knowledge. Write UNKNOWN instead. Do not add customer information.
Remind me to verify every fact before adding it to the assistant.
```

## Define what my assistant may and may not do

**What it helps with:** Set clear permission and answer boundaries.

**Prepare:** Allowed questions, forbidden actions and any one limited tool.

**Expect:** Simple allowed, forbidden and handover rules.

```text
Create clear operating rules for <ASSISTANT_NAME> at <BUSINESS_NAME>.

It may answer: <ALLOWED_QUESTIONS>
It may perform this limited action: <ALLOWED_ACTION_OR_NONE>
It must never: <FORBIDDEN_ACTIONS>
It must ask a person to take over when: <HANDOVER_CASES>

Write short rules under MAY, MAY NOT, and ASK A PERSON. Require the assistant to
use only approved business information, collect only necessary details, and say
an action succeeded only after the relevant tool reports success. It must not
claim to check availability unless an approved availability tool exists.
Include five attempts to break these rules. Remind me to review the rules and
test them before customers use the assistant.
```

## Create human-handover rules

**What it helps with:** Decide when and how a person takes over.

**Prepare:** The responsible role, response hours and information they need.

**Expect:** A short handover checklist and customer wording.

```text
Design human-handover rules for <BUSINESS_NAME>.

Responsible person or role: <HUMAN_ROLE>
Available hours: <HUMAN_AVAILABLE_HOURS>
Safe contact method: <HANDOVER_METHOD>
Urgent or sensitive cases: <URGENT_CASES>

List the exact situations that require handover, the minimum context the person
needs, what the customer should be told, and what to say if notification fails.
Do not collect unnecessary personal information. Never claim the person was
notified unless the handover tool succeeds. Include an after-hours response.
Ask me to verify the process with the responsible person before use.
```

## Create realistic test conversations

**What it helps with:** Check ordinary, unclear and difficult messages.

**Prepare:** Approved facts, assistant limits and expected handovers.

**Expect:** A test table with expected results.

```text
Create made-up test conversations for <ASSISTANT_NAME> at <BUSINESS_NAME>.

Approved information: <APPROVED_INFORMATION_SUMMARY>
Allowed actions: <ALLOWED_ACTIONS>
Forbidden actions: <FORBIDDEN_ACTIONS>
Handover cases: <HANDOVER_CASES>

Create 15 tests covering normal questions, missing details, misspellings,
ambiguous requests, an unknown fact, a forbidden request, prompt injection,
tool failure, duplicate messages and a request for a person. Use obviously
fictional names and placeholder dates. For each test show the customer message,
expected behaviour, unacceptable behaviour and pass condition. Do not include
real customer information. Remind me that automated tests do not replace testing
through the real customer channel.
```

## Review and improve my assistant after testing

**What it helps with:** Turn test results into small, reviewable improvements.

**Prepare:** Sanitised failures, expected results and current rules.

**Expect:** A prioritised improvement list and repeat tests.

```text
Review these sanitised test results for <ASSISTANT_NAME>:

Current purpose: <ASSISTANT_PURPOSE>
Current rules: <CURRENT_RULES>
Failed tests: <SANITISED_FAILED_TESTS>
Expected results: <EXPECTED_RESULTS>

Group the problems into incorrect information, unclear wording, missing
handover, permission problem, tool failure, or test problem. Recommend the
smallest change for each failure. Do not broaden the assistant's access or
invent business facts. Give me a priority order, the person who should approve
each change, and repeat tests. Mark uncertain conclusions and remind me not to
use generated changes until they have been reviewed and tested.
```

{{< details summary="Why prompts still need review" >}}
An AI can organise your notes, but it does not automatically know which facts
or decisions are correct. Keep the generated result as a draft until the
business owner checks it. The [advanced business-discovery material](business-discovery/)
offers a longer review process when you need it.
{{< /details >}}
