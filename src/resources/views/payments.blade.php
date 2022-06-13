
@extends('layout.app')

@section('content')
<table id="table_id" class="display">
    <thead>
        <tr>
            <th>Paypal ID</th>
            <th>Status</th>
            <th>User Name</th>
            <th>Amount</th>
            <th>Payer Name</th>
            <th>Currency</th>
            <th>Payment On</th>
            <th>Payer Country</th>
        </tr>
    </thead>
    <tbody>
        @foreach($data as $payment)
            <tr>
                <td>{{ $payment->paypal_id }}</td>
                <td>{{ $payment->status }}</td>
                <td>{{ $payment->name }}</td>
                <td>{{ $payment->amount }}</td>
                <td>{{ $payment->payer_name }}</td>
                <td>{{ $payment->currency_code }}</td>
                <td>{{ $payment->payment_on }}</td>
                <td>{{ $payment->currency_code }}</td>
            </tr>
        @endforeach
    </tbody>
</table>
@endsection

@section('script')
<script>
    $(document).ready(function() {
        $('#table_id').DataTable();
    });
</script>
@endsection