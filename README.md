# static-website-terraform
This project serves as a terraform demo project. It takes a map of different subdomains and creates a seperate S3 bucket and other configurations in AWS, including route 53 entries. It can take any number of subdomains and the subdomains can be in any region.

This project is simply meant as a learning project and reference for other terraform projects, not a hosting solution. For global/multi-region distribution of static content, cloudfront is a much better solution. This project simply demonstrates Terraform syntax and project structure.