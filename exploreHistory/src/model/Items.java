package model;

/**
 * Created by Administrator on 2016/4/11.
 */
public class Items {
        private int id;
        private String name;
        private String city;
        private int price;
        private int store;
        private String picture;

        public void setId(int id) {
            this.id = id;
        }

        public void setName(String name) {
            this.name = name;
        }

        public void setCity(String city) {
            this.city = city;
        }

        public void setPrice(int price) {
            this.price = price;
        }

        public void setStore(int store) {
            this.store = store;
        }

        public void setPicture(String picture) {
            this.picture = picture;
        }

        public int getId() {
            return id;
        }

        public String getName() {
            return name;
        }

        public String getCity() {
            return city;
        }

        public int getPrice() {
            return price;
        }

        public int getStore() {
            return store;
        }

        public String getPicture() {
            return picture;
        }

}
