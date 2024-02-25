import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/user_screens/details.dart';
import 'package:flutter_travel_concept/providers/medication.dart';

class VerticalMedItem extends StatelessWidget {
  var switchFavourite = false;

  @override
  Widget build(BuildContext context) {
    final Med = Provider.of<Medication>(context, listen: false);
    print('widget rebuild');
    return /*Consumer<Medication>this = Provider.of*/ (
        /**
       * when u use Provider.of the whole build method will rerun whenever that data changes
       * but u have a case where u only want to run subpart of your widget tree when some data
       * changes and then u could only wrap the subpart of the widget tree that depends on your
       * product data with that listener 
       */
        //builder: (ctx,Med,child)=>
        Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        child: Container(
          height: 70.0,
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  Med.img_path,
                  height: 70.0,
                  width: 70.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      Med.med_name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 3.0),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          size: 13.0,
                          color: Colors.blueGrey[300],
                        ),
                        const SizedBox(width: 3.0),
                        Text(
                          Med.ph_location.address,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13.0,
                            color: Colors.blueGrey[300],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      Med.med_price.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
               Consumer<Medication>(
                builder: (ctx,med,child)=>

              IconButton(
                onPressed: () {
                  // Handle favorite icon press
                  //  setState(() {
                  Med.toggleFavouriteStatus();
                  //});
                },
                icon: Med.isFavourite
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
              ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(Details.routeName, arguments: Med.id);
        },
      ),
    ));
  
  
  }
}
