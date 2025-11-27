---
learning_level: "Advanced"
prerequisites: ["./02_Detailed-Design-Part1-B.md"]
estimated_time: "15 minutes"
learning_objectives:
  - "Define the implementation strategy and technology stack"
  - "Link to the external code repository"
related_topics:
  builds_upon: ["./02_Detailed-Design-Part1-B.md"]
---

# Implementation Plan & Code Repository

## 1. Technology Stack Selection

Based on the architecture, the following stack is selected for implementation:

* **Backend (Control Plane)**: .NET 8 / ASP.NET Core (Minimal APIs + SignalR Hub).
* **Frontend**: React + TypeScript (Rich UI ecosystem).
* **Real-time**: SignalR (Signaling) + LiveKit or Azure Communication Services (Media/WebRTC).
* **AI & Workers**: Python (FastAPI) for Transcription, Summarization, and Media Processing.
* **Database**: PostgreSQL (Metadata) + Redis (Ephemeral State).
* **Infrastructure**: Azure AKS (Kubernetes), Azure Front Door, Azure Key Vault.

## 2. Repository Structure Strategy

We will use a **Polyrepo** approach where the implementation lives in a dedicated repository.

### Planned Folder Structure (Implementation Repo)

```text
video-signaling/
├── src/
│   ├── Client/                 # React Web App
│   ├── VideoSignaling.Api/     # .NET 8 Signaling Service
│   │   ├── Hubs/               # SignalR Hubs
│   │   ├── Services/           # Token & Room Logic
│   │   └── Program.cs
│   ├── Media.Worker/           # Python FastAPI Service
│   │   ├── app/                # AI/ML Logic (Whisper/OpenAI)
│   │   └── Dockerfile
│   └── Infrastructure/         # IaC (Bicep/Terraform)
├── k8s/                        # Helm Charts & Manifests
└── .github/                    # CI/CD Pipelines
```

## 3. Code Repository Link

The full implementation of this system design is maintained in the following repository:

> **🔗 [Link to Implementation Repository]**
> *(Placeholder: User to update this link after creating the new repo)*

## 4. Next Steps

1. **Initialize Repo**: Create the new GitHub repository.
2. **Scaffold Solution**: Set up the .NET solution and React project.
3. **Core API**: Implement the Meeting Management APIs defined in `02_Detailed-Design-Part1-A.md`.
4. **Link Back**: Update the link above to point to the live code.

## 5. Future Phases

* **Phase 2: Advanced Connectivity**: Implement STUN/TURN server configuration (coturn) or integrate Azure Communication Services for reliable NAT traversal.
* **Phase 3: Group Scaling**: Implement SFU logic for supporting >5 participants.
* **Phase 4: Live Streaming**: Add RTMP ingest and HLS delivery for one-to-many broadcasting.
