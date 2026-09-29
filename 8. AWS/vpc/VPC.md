# AWS VPC for Data Engineers

You do not need to become a network engineer, but you must understand the basics.

## Learn

- VPC
- CIDR
- Public subnet
- Private subnet
- Route table
- Internet Gateway
- NAT Gateway
- Security Group
- Network ACL
- VPC Endpoint

## Typical architecture

```text
VPC
├── Public subnet
└── Private subnets
    ├── Databases
    ├── Redshift
    └── Compute
```

## Important

Understand how a private workload accesses S3 and other AWS services.

Learn VPC endpoints.

## Interview

- Public vs private subnet
- NAT Gateway
- Security Group vs NACL
- VPC Endpoint
- Why keep databases private?
