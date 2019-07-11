/*Let's make a function dinerBreakfast. Ultimately, we want it to return an anonymous closure, which we will be able to use to keep adding breakfast foods to our initial order.*/

const dinerBreakfast = function() {
  const orders = ['cheesy scrambled eggs'];
  console.log(`I\'d like ${orders[0]} please.`);

  const addOrder = function(order) {
    orders.push(order);
    console.log(`I\'d like ${orders.join(" and ")} please.`);
  };

  return addOrder;
};

let bfastOrder = dinerBreakfast();
bfastOrder('sausages');
bfastOrder('pancakes');
