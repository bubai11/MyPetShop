using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyPetShop.BLL;
using System.Data;

namespace MyPetShop.Web.Controls
{
    public partial class PetTree : System.Web.UI.UserControl
    {
        private readonly CategoryService categoryService = new CategoryService();
        public bool IsExpanded
        {
            get { return (bool)(ViewState["IsExpanded"] ?? true); }
            set { ViewState["IsExpanded"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 设置为折叠  
                IsExpanded = true;
                LoadCategories();
                ToggleVisibility();
            }
        }
        private void ToggleVisibility()
        {
            // 控制 TreeView 的可见性为 true         
            TreeViewCategories.Visible = true; // 确保 TreeView 始终可见  
        }
        // 加载所有分类
        public void LoadCategories()
        {
            try
            {
                // 调用 CategoryService 获取分类数据
                DataTable categories = categoryService.GetAllCategories();

                if (categories != null && categories.Rows.Count > 0)
                {
                    // 清空 TreeView 控件
                    TreeViewCategories.Nodes.Clear();

                    // 遍历分类数据并创建节点
                    foreach (DataRow row in categories.Rows)
                    {
                        TreeNode categoryNode = new TreeNode
                        {
                            Text = row["Name"].ToString(),
                            Value = row["CategoryId"].ToString(),
                            NavigateUrl = ResolveUrl($"~/Pages/ProShow.aspx?CategoryId={row["CategoryId"]}")
                        };

                        // 设置分类节点展开
                        categoryNode.Expanded = IsExpanded;  // 根据是否展开设置

                        TreeViewCategories.Nodes.Add(categoryNode);

                        // 加载该分类下的商品节点
                        LoadProductsForCategory(categoryNode, int.Parse(row["CategoryId"].ToString()));
                    }
                }
            }
            catch (Exception ex)
            {
                // 处理错误
                Console.WriteLine("加载分类数据时出错: " + ex.Message);
            }
        }
        // 加载商品数据并绑定到对应分类的子节点
        // 异步加载商品节点
        private void LoadProductsForCategory(TreeNode categoryNode, int categoryId)
        {
            try
            {
                // 使用懒加载：只有展开时才加载商品数据
                if (categoryNode.ChildNodes.Count == 0)  // 如果没有子节点，才进行加载
                {
                    DataTable products = categoryService.GetProductsByCategory(categoryId);

                    if (products != null && products.Rows.Count > 0)
                    {
                        foreach (DataRow row in products.Rows)
                        {
                            TreeNode productNode = new TreeNode
                            {
                                Text = row["Name"].ToString(),
                                Value = row["ProductId"].ToString(),
                                NavigateUrl = ResolveUrl($"~/Pages/ProShow.aspx?ProductName={row["Name"]}")
                            };
                            categoryNode.ChildNodes.Add(productNode);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // 使用日志记录异常
                // log.Error("加载商品数据时出错: " + ex.Message);
                Console.WriteLine("加载商品数据时出错: " + ex.Message);
            }
        }
        // 确保方法名称与事件匹配  
        protected void TreeViewCategories_SelectedNodeChanged(object sender, EventArgs e)
        {
            string selectedNodeUrl = TreeViewCategories.SelectedNode.NavigateUrl;
            if (!string.IsNullOrEmpty(selectedNodeUrl))
            {
                Response.Redirect(selectedNodeUrl);
            }
        }

        //    // 加载分类数据并绑定到 TreeView
        //    private void LoadCategories()
        //    {
        //        try
        //        {
        //            // 调用 CategoryService 获取分类数据
        //            DataTable categories = categoryService.GetAllCategories();

        //            if (categories != null && categories.Rows.Count > 0)
        //            {
        //                // 清空 TreeView 控件
        //                TreeViewCategories.Nodes.Clear();

        //                // 遍历分类数据并创建节点
        //                foreach (DataRow row in categories.Rows)
        //                {
        //                    TreeNode categoryNode = new TreeNode
        //                    {
        //                        Text = row["Name"].ToString(),
        //                        Value = row["CategoryId"].ToString(),
        //                        NavigateUrl = $"~/Products.aspx?CategoryId={row["CategoryId"]}"
        //                    };
        //                    TreeViewCategories.Nodes.Add(categoryNode);

        //                    // 加载该分类下的商品节点
        //                    LoadProductsForCategory(categoryNode, int.Parse(row["CategoryId"].ToString()));
        //                }
        //            }
        //        }
        //        catch (Exception ex)
        //        {
        //            // 处理错误
        //            Console.WriteLine("加载分类数据时出错: " + ex.Message);
        //        }
        //    }

        //    // 加载商品数据并绑定到对应分类的子节点
        //    private void LoadProductsForCategory(TreeNode categoryNode, int categoryId)
        //    {
        //        try
        //        {
        //            // 调用 CategoryService 获取商品数据
        //            DataTable products = categoryService.GetProductsByCategory(categoryId);

        //            if (products != null && products.Rows.Count > 0)
        //            {
        //                foreach (DataRow row in products.Rows)
        //                {
        //                    TreeNode productNode = new TreeNode
        //                    {
        //                        Text = row["Name"].ToString(),
        //                        Value = row["ProductId"].ToString(),
        //                        NavigateUrl = $"~/ProductDetails.aspx?ProductId={row["ProductId"]}"
        //                    };
        //                    categoryNode.ChildNodes.Add(productNode);
        //                }
        //            }
        //        }
        //        catch (Exception ex)
        //        {
        //            // 处理错误
        //            Console.WriteLine("加载商品数据时出错: " + ex.Message);
        //        }
        //    }

        //    // 当用户选择一个节点时触发的事件
        //    protected void TreeViewCategories_SelectedNodeChanged(object sender, EventArgs e)
        //    {
        //        // 处理节点选择事件
        //        string selectedValue = TreeViewCategories.SelectedValue;
        //        Response.Redirect(TreeViewCategories.SelectedNode.NavigateUrl);
        //    }

    }
}
