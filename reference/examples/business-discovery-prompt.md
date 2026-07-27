# Business discovery prompt

This is the canonical reusable prompt for drafting a structured
business-assistant brief. Copy it to a private location before filling it in.

Do not enter credentials, production access details, customer records, private
conversations, real administrator contact details, or private server evidence.
Use reviewed business facts, generic customer categories, synthetic scenarios,
and `UNKNOWN` for information that has not been confirmed.

## Prompt

```text
You are helping an authorised business owner prepare a structured brief for a
possible future business assistant.

Your task is discovery and documentation only. Do not configure software,
request credentials, make API calls, or claim that any system is working.

Working information

- Business name placeholder: <BUSINESS_NAME>
- Business type: <BUSINESS_TYPE>
- Short business summary: <BUSINESS_SUMMARY>
- Customer types: <CUSTOMER_TYPES>
- Common customer goals: <COMMON_CUSTOMER_GOALS>
- Supported requests: <SUPPORTED_REQUESTS>
- Unsupported requests: <UNSUPPORTED_REQUESTS>
- Business hours and availability rules: <BUSINESS_HOURS_AND_AVAILABILITY>
- Information the assistant may provide: <ALLOWED_ASSISTANT_INFORMATION>
- Information the assistant must not provide: <PROHIBITED_ASSISTANT_INFORMATION>
- Minimum information needed from customers: <REQUIRED_CUSTOMER_INFORMATION>
- Data that should not be collected: <PROHIBITED_CUSTOMER_DATA>
- Human escalation contact role: <ESCALATION_CONTACT_ROLE>
- Escalation conditions: <ESCALATION_CONDITIONS>
- Safe failure behaviour: <FAILURE_BEHAVIOUR>
- Tone and language preferences: <TONE_AND_LANGUAGE_PREFERENCES>
- Possible narrowly scoped tools: <POSSIBLE_NARROW_TOOLS>
- Known risks: <KNOWN_RISKS>
- Unresolved questions: <UNRESOLVED_QUESTIONS>

Rules for your response

1. Do not invent business information. Mark missing information as UNKNOWN.
2. Identify every assumption explicitly.
3. Separate confirmed facts from assumptions and suggestions.
4. Do not request passwords, tokens, private keys, production addresses, or
   other credentials.
5. Minimise personal-data collection. Recommend only information necessary for
   a stated supported request.
6. Recommend human escalation for sensitive, unsupported, uncertain, or
   unconfirmed cases.
7. Suggest narrowly scoped tools for specific approved outcomes. Do not suggest
   broad access to a server, filesystem, email account, calendar, database, or
   general-purpose command execution.
8. Treat every tool as an unapproved proposal requiring security and technical
   review.
9. Flag every policy, capability, data, escalation, and tool decision that
   requires owner approval.
10. Use synthetic descriptions in proposed tests. Do not create customer
    records or identifying examples.
11. State risks and unresolved questions plainly.
12. Produce the structured output below. Do not omit a section; use UNKNOWN or
    NOT_APPLICABLE with a short reason where necessary.

Required output

1. Review status
   - Information supplied
   - Missing information
   - Contradictions requiring clarification

2. Confirmed business facts
   - Business summary
   - Customer types
   - Business hours and availability rules
   - Tone and language preferences

3. Customer goals and assistant scope
   - Common customer goals
   - Supported requests
   - Unsupported requests
   - Information the assistant may provide
   - Information the assistant must not provide

4. Customer-information boundaries
   - Minimum information needed for each supported request
   - Data that should not be collected
   - Questions requiring a privacy or owner review

5. Escalation and failure behaviour
   - Escalation conditions
   - Escalation contact role
   - Behaviour when facts are missing
   - Behaviour when an action cannot be confirmed
   - Behaviour when no authorised person is available

6. Tone and language guidance
   - Confirmed preferences
   - Preferences that still require review
   - Boundaries that tone must not override

7. Possible narrowly scoped tools
   For each proposal provide:
   - One specific outcome
   - Minimum required input
   - Expected result
   - Access that must remain prohibited
   - Failure and escalation behaviour
   - Required owner, security, and technical approvals

8. Risks and safeguards
   - Known risks
   - Additional suggested risks, clearly labelled as suggestions
   - Possible safeguards, clearly labelled as suggestions

9. Assumptions and unresolved questions
   For each item provide:
   - The assumption or question
   - Why it matters
   - Evidence needed
   - Owner-approval role
   - Work that must remain blocked until resolved

10. Proposed acceptance tests
    Include normal, boundary, failure, confusing, and hostile synthetic cases.
    For each test provide:
    - Scenario
    - Expected response or action
    - Information that may be requested
    - Information that must not be requested
    - Whether escalation is expected
    - Decision or fact the owner must verify

11. Owner-approval checklist
    List every proposed fact, rule, boundary, escalation condition, tool,
    safeguard, and acceptance criterion that requires approval.

End with a reminder that this brief is a reviewed design input, not deployed
logic or proof that an integration works.
```

## Review boundary

The generated output must be checked against verified business information by
an authorised person. It must remain private if it contains real business
details, risks, decisions, or escalation arrangements.

Do not convert unreviewed output directly into assistant behaviour or technical
configuration.
