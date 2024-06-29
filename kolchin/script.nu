const DATA = export-0xc95063d946242f26074a76c8a2e94c9d735dfc78.csv

export def transactions [] {
	open $DATA
	# built-in for the SafeMoon contract
	| where Method =~ "Remove Liquidity"
	# Two errors occured at the beginning, skipping over them
	| where Status !~ "Error"
	# not relevant
	| reject "Blockno" "ContractAddress" "Status" "ErrCode" "UnixTimestamp" "CurrentValue @ $569.500891388171/BNB"
	# dates
	| update "DateTime (UTC)" {into datetime}
	# always the same
	| reject "From" "To"
}
