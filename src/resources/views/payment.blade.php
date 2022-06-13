<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://www.paypal.com/sdk/js?client-id=AfIPBOdNvGdGf9TTzbcfYaU1YZulrdhAR3lmSKU0gp7umY8lOedr8xublB5U4SpWEOXpYxq7RT4CL7XA"></script>
</head>

<body>
    <p><strong>Amount:</strong> ${{ $amount }}</p>
    <p><strong>Hoots:</strong> {{ $hoots }}</p>
    <br />
    <div id="paypal-button-container"></div>
    <script>
        paypal.Buttons({
            createOrder: function(data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: '{{ $amount }}' // Can reference variables or functions. Example: `value: document.getElementById('...').value`
                        }
                    }]
                });
            },
            onApprove: function(data, actions) {
                return actions.order.capture().then(function(orderData) {
                    fetch("/api/payment", {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({
                            "paypal_id": orderData.id,
                            "intent": orderData.intent,
                            "status": orderData.status,
                            "amount": orderData.purchase_units[0].amount.value,
                            "currency_code": orderData.purchase_units[0].amount.currency_code,
                            "payment_on": orderData.purchase_units[0].payments.captures[0].create_time,
                            "payer_name": `${orderData.payer.name.given_name} ${orderData.payer.name.surname}`,
                            "payer_email": orderData.payer.email_address,
                            "payer_country_code": orderData.payer.address.country_code,
                            "user_id": '{{$user}}',
                            "hoots": '{{$hoots}}'
                        })
                    }).then(data => {
                        console.log('Capture result', orderData, JSON.stringify(orderData, null, 2));
                        var transaction = orderData.purchase_units[0].payments.captures[0];
                        alert('Transaction ' + transaction.status + ': ' + transaction.id + '\n\nSee console for all available details');
                    });
                });
            }

        }).render('#paypal-button-container');
    </script>
</body>

</html>