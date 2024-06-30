import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/features/home/presentation/view_model/get_offers_cubit/get_offers_cubit.dart';

class OffersCarsuralSlider extends StatelessWidget {
  const OffersCarsuralSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOffersCubit, GetOffersState>(
      builder: (context, state) {
        if (state is GetOffersLoaded) {
          return SizedBox(
            height: 160.h,
            width: MediaQuery.sizeOf(context).width,
            child: CarouselSlider.builder(
              itemCount: state.instanceOfOfferModel.images.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    // color: Colors.amber,
                    image: DecorationImage(
                      image: NetworkImage(
                        state.instanceOfOfferModel.images[index],
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
              options: CarouselOptions(height: 160.h, viewportFraction: 0.9),
            ),
          );
        } else if (state is GetOffersFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
