resource "aws_vpc_peering_connection" "default" {
  count = var.is_peering_required ? 1 : 0
  peer_vpc_id   = data.aws_vpc.default.id
  vpc_id        = aws_vpc.main.id
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags = merge(
    var.vpc_peering_tags,
    local.common_tags,
    {
      Name = "${local.common_name}-peering"
    }
  )
}

resource "aws_route" "public_peering" {
  
  route_table_id            = aws_route_table.public.id
  count = var.is_peering_required ? 1 : 0
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.default[count.index].id
  gateway_id = aws_internet_gateway.igw.id
}