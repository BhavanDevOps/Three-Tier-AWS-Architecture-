#   CREATE INTERNET GATEWAY
resource "aws_internet_gateway" "igw" {
    vpc_id=aws_vpc.my-vpc.id
    tags={
        Name="Demo IGW"
    }
  
}

#CREATE WEB LAYER ROUTE TABLE
resource "aws_route_table" "web-rt" {
    vpc_id=aws_vpc.my-vpc.id
    route{
        cidr_block="0.0.0.0/0"
        gateway_id=aws_internet_gateway.igw.id
    }
    tags={
        Name="Web-Rt"
    }
  
}

#CREATE WEB SUBNET ASSOCIATION WITH WEB ROUTE TABLE
resource "aws_route_table_association" "a" {
    subnet_id=aws_subnet.web-subnet-1.id
    route_table_id=aws_route_table.web-rt.id
}
resource "aws-route_table_association" "b" {
    subnet_id=aws_subnet.web-subnet-2.id
    route_table_id=aws_route_table.web-rt.id
}