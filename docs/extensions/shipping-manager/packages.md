# Dubas Packages
![Packages](../../images/shipping-manager/packages.png)

Entity which contain information about specific package. Each package is assigned to parcel.

## :material-book-plus-multiple: How to create your first Paypal Plan?
1.	Go to **Packages** entity.
2.	Fill all mandatory fields like type of package, value, height etc. 
3.	Save.

## :material-folder-information-outline: Explanation of fields
1. **Parcel** - to which parcel package is related. Link to Parcels entity.
2. **Weight** - weight of package in kg's. Enter only number.
3. **Width** - width of package in cm's. Enter only number.
4. **Height** - height of package in cm's. Enter only number.
5. **Lenght** - lenght of package in cm's. Enter only number.
6. **Package number** - number created based on parcel number.
7. **Value** - value of package. 
8. **Pickup date** - when package was collected.
9. **Delivery date** - when package was delivered.
10. **Description of content** - description of package content.
11. **Reference number** - reference number for package. If empty, will be populated from Parcel.
12. **Type** - type of package.      
    a.	**Package**  
    b.	**Dox**   
    c.	**Pallet**   

13. **Status** - current status of package.       
    a.	**New** - package was created  
    b.	**Package accepted** - package was accepted by personel  
    c.	**Collected** - package was collected from sender  
    d.	**Shipped** - package was shipped  
    e.	**In transit** - package in transit  
    f.	**Arrived at destination** - package arrived at destination, for example warehouse   
    g.	**Out for delivery** - package is in delivery  
    h.	**Ready to Pickup** - package waiting for pickup(only if delivery is to Pickup Point)  
    i.	**Delivered** - Delivered/picked by client from Pickup Point  
    j.	**Unsuccessful delivery attempt** - courier couldn't deliver package to the client  
    k.	**Returned to sender** - package was returned to sender  