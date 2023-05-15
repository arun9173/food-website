<?php

    if(!isset($_SERVER['HTTP_REFERER'])){
        header('location: http://localhost/FreshFood/index.php');
        exit;
    }

?>


<?php require "../includes/header.php"; ?> 

<?php


        if (!isset($_SESSION['username'])) {

            echo " <script>window.location.href='".APPURL."';</script>";

        }




?>

        <div class="banner">
            <div class="jumbotron jumbotron-bg text-center rounded-0" style="background-image: url('<?php echo APPURL; ?>/assets/img/bg-header.jpg');">
                <div class="container">
                    <h1 class="pt-5">
                        Pay with Paypal Page
                    </h1>
                    <p class="lead">
                        Save time and leave the groceries to us.
                    </p>

      <!-- Replace "test" with your own sandbox Business account app client ID -->
      <script src="https://www.paypal.com/sdk/js?client-id=AZideGHVwT4T28WGuzhW_zCOfhq-FyQHdh_um07I05U0WSuI_lOpFmx_UjjYkBIXtCxHq7ovkL8qzleC&currency=USD"></script>
                    <!-- Set up a container element for the button -->
                <div id="paypal-button-container"></div>
                    <script>
                        paypal.Buttons({
                        // Sets up the transaction when a payment button is clicked
                        createOrder: (data, actions) => {
                            return actions.order.create({
                            purchase_units: [{
                                amount: {
                                value: '<?php echo $_SESSION['total_price']; ?>' // Can also reference a variable or function
                                }
                            }]
                            });
                        },
                        // Finalize the transaction after payer approval
                        onApprove: (data, actions) => {
                            return actions.order.capture().then(function(orderData) {
                          
                            //  console.log('capture result', orderData, JSON.stringify(orderData, null, 2));

                            //  const transaction = orderData.purchase_units[0].payments.captures[0];

                            //  alert(`Transcation ${transaction.status}: ${transaction.id}\n\nSee console for all available details`);

                            window.location.href='success.php';

                            });
                        }
                        }).render('#paypal-button-container');
                   </script>

                </div>
            </div>
        </div>
              
<?php require "../includes/footer.php"; ?> 



